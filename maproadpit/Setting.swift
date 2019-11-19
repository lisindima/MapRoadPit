//
//  Setting.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 18.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI

struct Setting: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: LocationStore
    @Binding var modalView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Информация").bold()) {
                    NavigationLink(destination: InfoApp()) {
                        Text("О приложении")
                    }
                }
            }
            .navigationBarTitle(Text("Настройки"), displayMode: .inline)
            .navigationBarItems(trailing: Button (action: {
                self.modalView = false
            })
            {
                Text("Готово")
                    .bold()
            })
        }
    }
}
