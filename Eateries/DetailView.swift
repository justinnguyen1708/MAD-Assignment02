//
//  DetailView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

// Show eatery information
struct DetailView: View {
    @ObservedObject var eatery: Eatery
    
    @Environment(\.editMode) var mode
    
    var body: some View {
        List {
            if mode?.wrappedValue == .active {
                HStack {
                    TextField("Eatery image", text: $eatery.image, onCommit: {
                        EateriesApp.save()
                    })
                }
                // Eatery title, description and story are shown in this section
                Section(header: TextField("Name", text: $eatery.name, onCommit: {
                    EateriesApp.save()
                })){
                    TextField("Location", text: $eatery.location, onCommit: {
                        EateriesApp.save()
                    })
                }
                
                // Recipe section
                Section (header: Text("NOTES")){
                    TextEditor(text: $eatery.notes)
                        .onChange(of: eatery.notes, perform: { value in
                            EateriesApp.save()
                        })
                }
                
                // Ingredients section
                Section (header: Text("REVIEWS")){
                    ForEach(0..<eatery.reviews.count, id: \.self) { i in
                        HStack {
                            TextField("Author", text: $eatery.reviews[i][0], onCommit: {
                                EateriesApp.save()
                            })
                                .font(.body)
                                .frame(width: 60.0)
                            Spacer()
                                .frame(width: 50.0)
                            TextField("Review", text: $eatery.reviews[i][1], onCommit: {
                                EateriesApp.save()
                            })
                                .font(.body)
                                .multilineTextAlignment(.leading)
                        }
                        // Delete a ingredient
                    }.onDelete { indices in
                        eatery.removeReview(at: indices)
                        EateriesApp.save()
                        // Reorder a ingredient
                    }.onMove { (indices, destination) in
                        eatery.moveReview(from: indices, to: destination)
                        EateriesApp.save()
                    }
                    
                    HStack{
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "plus")
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                        }.onTapGesture {
                            withAnimation{
                                eatery.addNewReview()
                                EateriesApp.save()
                            }
                        }
                        Spacer()
                    }
                }
            } else {
                HStack {
                        Spacer()
                        eatery.downloadEateryImage(eateryURL: eatery.image)
                            .resizable()
                            .frame(width: 288.0, height: 256.0, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 200)
                        Spacer()
                }
                // Eatery title, description and story are shown in this section
                Section(header: Text(eatery.name)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                ){
                    Text(eatery.location)
                        .font(.body)
                }
                
                // Recipe section
                Section (header: Text("NOTES")){
                    Text(eatery.notes)
                        .font(.body)
                }
                
                // Ingredients section
                Section (header: Text("REVIEWS")){
                    ForEach(0..<eatery.reviews.count, id: \.self) { i in
                        HStack {
                            Text(eatery.reviews[i][0])
                                .font(.body)
                                .frame(width: 50.0)
                            Spacer()
                                .frame(width: 50.0)
                            Text(eatery.reviews[i][1])
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
