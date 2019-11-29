//
//  NewPit.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 21.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import CustomInput
import CustomButton

struct NewPit: View {
    
    @EnvironmentObject var session: LocationStore
    @Binding var modalView: Bool
    @State private var geopoint: String = ""
    @State private var name: String = ""
    @State private var razmer: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    func savePit() {
        let lat = (latitude as NSString).doubleValue
        let lon = (longitude as NSString).doubleValue
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        session.addData(nameDB: name, latitude: lat, longitude: lon)
        self.modalView = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    NewMapView()
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 300)
                    CustomInput(text: self.$name, name: "Опишите проблему")
                        .padding([.horizontal, .top])
                    CustomInput(text: self.$geopoint, name: "Укажите адрес или координаты")
                        .padding([.horizontal, .top])
                    HStack {
                        CustomInput(text: self.$latitude, name: "Широта")
                            .padding(.trailing, 5)
                            .keyboardType(.decimalPad)
                        CustomInput(text: self.$longitude, name: "Долгота")
                            .padding(.leading, 5)
                            .keyboardType(.decimalPad)
                    }.padding([.horizontal, .top])
                    CustomInput(text: self.$razmer, name: "Укажите размер")
                        .padding([.horizontal, .top])
                }
                CustomButton(
                    label: "Сохранить",
                    action: savePit
                ).padding()
            }
            .keyboardObserving()
            .navigationBarTitle(Text("Добавить"), displayMode: .inline)
            .navigationBarItems(trailing: Button (action: {
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
