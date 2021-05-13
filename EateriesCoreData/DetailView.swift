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
        Text(eatery.imageString)
        Text(eatery.nameString)
        Text(eatery.locationString)
        Text(eatery.notesString)
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
