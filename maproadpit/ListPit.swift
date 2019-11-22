//
//  ListPit.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 21.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI

struct ListPit: View {
    
    @EnvironmentObject var session: LocationStore
    @ObservedObject var itemList = LocationStore()
    @Binding var modalView: Bool
    
    func delete(at offsets: IndexSet) {
        itemList.dataLocation.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        itemList.dataLocation.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemList.dataLocation) { item in
                    NavigationLink(destination: ListDetails(name: item.nameDB)) {
                        ListItem(name: item.nameDB)
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Список"), displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button (action: {
                self.modalView = false
                })
                {
                Text("Закрыть")
                    .bold()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
