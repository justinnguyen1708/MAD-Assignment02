//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/13/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var eateryModel: EateryModel
    
    var body: some View {
        List {
            ForEach(eateryModel.eateriesArray) { eatery in
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
            }.onDelete { offsets in
                eateryModel.deleteEatery(offsets: offsets)
            }
        }
        .navigationBarTitle("Eateries")
        .navigationBarItems(leading: EditButton(),
                             trailing: Button(action: {
                                 withAnimation{
                                     eateryModel.addEatery()
                                 }
                             }) {
                                 Image(systemName: "plus")
                             })
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}
