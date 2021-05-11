//
//  RowView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

/// Show image, name, and notes of eateries
struct RowView: View {
    @ObservedObject var eatery: Eatery
    var body: some View {
        HStack {
            // Image of the eatery
            eatery.downloadEateryImage(eateryURL:eatery.image)
                .resizable()
                .frame(width:80.0, height:80.0)
                .cornerRadius(15)
            // Title and subtitle (description)
            VStack (alignment: .leading){
                Text(eatery.name)
                    .font(.headline)
                Text(eatery.notes)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            .frame(height: 80.0)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var eatery = Eatery(image: "https://www.visitbrisbane.com.au/~/media/articles/2021/february/coppaspuntinopasta_20210223_wide.ashx", name: "Coppa Spuntino", location: "CBD", notes: """
The love affair between Brisbane and Italy continues with the much-awaited opening of COPPA at Eagle Street Pier. \
COPPA brings Italian flavours and flair to the table with indoor and alfresco spaces available when it opens in mid January.
""", reviews: [["A","I like it"], ["B","I do not like it"]])
    
    static var previews: some View {
        RowView(eatery: EateriesApp.eateryViewModel.listOfEateries[0])
    }
}
