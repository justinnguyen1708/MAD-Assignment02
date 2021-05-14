//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.editMode) var editMode

    @ObservedObject var eatery: Eatery
    
    var body: some View {
        List {
            if editMode?.wrappedValue == .active {
                HStack {
                    TextField("Enter Image URL", text: $eatery.imageString, onCommit: {
                        try?viewContext.save()
                    })
                }
                // Eatery title, description and story are shown in this section
                Section(header: TextField("Enter Name", text: $eatery.nameString, onCommit: {
                    try?viewContext.save()
                })){
                    TextField("Enter Location", text: $eatery.locationString, onCommit: {
                        try?viewContext.save()
                    })
                }
                
                // Notes section
                Section (header: Text("NOTES")){
                    TextEditor(text: $eatery.notesString)
                        .onDisappear(){
                            try?viewContext.save()
                        }
                }
                
                // Reviews section
                Section (header: HStack{
                    Text("REVIEWS")
                    Spacer()
                    Button(action: {
                        withAnimation{
                            eatery.addReview()
                        }
                    }) {
                        Image(systemName: "plus")
                    }
                }){
                    ForEach(eatery.reviewsArray) { review in
                        ReviewView(review: review)
                    }.onDelete { offsets in
                        eatery.deleteReview(offsets: offsets)
                    }.onMove(perform: { indices, newOffset in
                        eatery.moveReview(from: indices, to: newOffset)
                    })
                }
            } else {
                HStack {
                        Spacer()
                        eatery.downloadEateryImage(eateryURL: eatery.imageString)
                            .resizable()
                            .frame(width: 288.0, height: 256.0, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 200)
                        Spacer()
                }
                // Eatery title, description and story are shown in this section
                Section(header: Text(eatery.nameString)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                ){
                    Text(eatery.locationString)
                        .font(.body)
                }
                
                // Notes section
                Section (header: Text("NOTES")){
                    Text(eatery.notesString)
                        .font(.body)
                }
                
                // Review section
                Section (header: Text("REVIEWS")){
                    ForEach(eatery.reviewsArray) { review in
                        HStack {
                            Text(review.authorString)
                                .font(.body)
                                .frame(width: 50.0)
                            Spacer()
                                .frame(width: 50.0)
                            Text(review.commentString)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
