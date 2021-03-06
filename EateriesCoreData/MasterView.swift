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
        VStack {
            TitleEditorView(eateryModel: eateryModel)

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
                }.onMove(perform: { indices, newOffset in
                    eateryModel.moveEatery(from: indices, to: newOffset)
                })
            }
        }
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
