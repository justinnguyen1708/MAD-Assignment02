//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/11/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \EateryModel.name, ascending: true)],
        animation: .default)
    private var eateryModel: FetchedResults<EateryModel>
    
    var body: some View {
        NavigationView {
            MasterView(eateryModel: eateryModel.first ?? EateryModel(context: viewContext))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
