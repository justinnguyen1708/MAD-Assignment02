//
//  TitleEditorView.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/14/21.
//

import SwiftUI

struct TitleEditorView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var eateryModel: EateryModel
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        VStack {
            if editMode?.wrappedValue == .active {
                HStack {
                    Text("✏️").font(Font.system(.largeTitle).bold())
                    TextField("Enter Title", text: $eateryModel.nameString, onCommit: {
                        try?viewContext.save()
                    }).font(Font.system(.largeTitle).bold())
                }
            }
        }.navigationTitle(editMode?.wrappedValue == .active ? "" : eateryModel.nameString)
    }
}

//struct TitleEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleEditorView()
//    }
//}
