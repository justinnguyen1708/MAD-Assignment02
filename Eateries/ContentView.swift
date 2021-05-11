//
//  ContentView.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

/// ContentView to show NavigationView which contains MasterView
struct ContentView: View {
    @Binding var eateryViewModel: EateryViewModel
    
    var body: some View {
        NavigationView {
            MasterView(eateryViewModel: eateryViewModel)
                .navigationBarTitle("Eateries")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        withAnimation{
                                            eateryViewModel.addNewEatery()
                                            EateriesApp.save()
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                    })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(eateryViewModel: Binding(get: {
            EateriesApp.eateryViewModel
        }, set: { newValue in
            EateriesApp.eateryViewModel = newValue
        }))
    }
}
