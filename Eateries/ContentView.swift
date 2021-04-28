//
//  ContentView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listOfEateries: EateryViewModel
    
    var body: some View {
        NavigationView {
            MasterView(listOfEateries: listOfEateries)
                .navigationBarTitle("Eateries")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        withAnimation{
                                            listOfEateries.addNewEatery()
                                            
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                    })
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
