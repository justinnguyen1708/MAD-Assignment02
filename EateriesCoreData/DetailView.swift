//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var eatery: Eatery
    
    var body: some View {
        List {
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
            Section (header: HStack{
                Text("REVIEWS")

                Button(action: {
                    withAnimation{
                        eatery.addReview()
                    }
                }) {
                    Image(systemName: "plus")
                }
            }){
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
                }.onDelete { offsets in
                    eatery.deleteReview(offsets: offsets)
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
