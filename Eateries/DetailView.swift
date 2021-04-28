//
//  DetailView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var eatery: Eatery
    @Environment(\.editMode) var mode
    
    var body: some View {
        List {
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

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
