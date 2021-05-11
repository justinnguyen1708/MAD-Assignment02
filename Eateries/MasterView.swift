//
//  MasterView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

/// MasterView show listOfEateries
struct MasterView: View {
    @Environment(\.editMode) var editMode
    
    // listOfFood can be changed
    @ObservedObject var eateryViewModel: EateryViewModel
    
    var body: some View {
        List {
            ForEach(eateryViewModel.listOfEateries) { eatery in
                NavigationLink(
                    destination: DetailView(eatery: eatery)
                        .navigationBarItems(trailing: EditButton()),
                    // Eatery item thumbnail
                    label: {
                        // This view is created to ensure information are updated
                        // in MasterView after modifying information in DetailView
                        RowView(eatery: eatery)
                    })
                // Delete a specific eatery
            }.onDelete { indices in
                eateryViewModel.removeEatery(at: indices)
                EateriesApp.save()
                // Reorder eateries
            }.onMove { (indices, destination) in
                eateryViewModel.moveEatery(from: indices, to: destination)
                EateriesApp.save()
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(eateryViewModel: EateriesApp.eateryViewModel)
    }
}
