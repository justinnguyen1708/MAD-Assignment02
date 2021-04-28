//
//  MasterView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.editMode) var editMode
    
    // listOfFood can be changed
    @ObservedObject var listOfEateries: EateryViewModel
    
    var body: some View {
        List {
            ForEach(listOfEateries.listOfEateries) { eatery in
                NavigationLink(
                    destination: DetailView(eatery: eatery)
                        .navigationBarItems(trailing: EditButton()),
                    // Eatery item thumbnail
                    label: {
                        RowView(eatery: eatery)
                    })
                // Delete a specific eatery
            }.onDelete { indices in
                listOfEateries.removeEatery(at: indices)
                // Reorder eateries
            }.onMove { (indices, destination) in
                listOfEateries.moveEatery(from: indices, to: destination)
            }
        }
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}
