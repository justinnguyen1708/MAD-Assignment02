//
//  RowView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

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

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
