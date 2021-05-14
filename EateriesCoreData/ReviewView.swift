//
//  ReviewView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/14/21.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var review: Review
    
    var body: some View {
        HStack {
            TextField("Author", text: $review.authorString, onCommit: {
                try?viewContext.save()
            })
            .font(.body)
            .frame(width: 50.0)
            Spacer()
                .frame(width: 50.0)
            TextField("Comment", text: $review.commentString, onCommit: {
                try?viewContext.save()
            })
            .font(.body)
            .multilineTextAlignment(.leading)
        }
    }
}

//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView()
//    }
//}
