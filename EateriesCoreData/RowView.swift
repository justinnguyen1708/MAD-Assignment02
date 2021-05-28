//
//  RowView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var eatery: Eatery
    
    var body: some View {
        HStack {
            // Image of the eatery
            eatery.downloadEateryImage(eateryURL:eatery.imageString)
                .resizable()
                .frame(width:80.0, height:80.0)
                .cornerRadius(15)
            // Title and subtitle (description)
            VStack (alignment: .leading){
                Text(eatery.nameString)
                    .font(.headline)
                Text(eatery.notesString)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            .frame(height: 80.0)
        }
    }
}
