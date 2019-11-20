//
//  ContentView.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 12.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import CoreLocation
import KeyboardObserving

struct ContentView: View {
    
    @EnvironmentObject var session: LocationStore    
    @State private var selectedLandmark: DataLocation? = nil
    @State private var modalView: Bool = false
    @State private var choiseModal: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(landmarks: $session.dataLocation, selectedLandmark: $selectedLandmark)
                    .edgesIgnoringSafeArea(.vertical)
                VStack {
                    Spacer()
                    Button(action: {
                        self.choiseModal = 2
                        self.modalView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
            .onAppear(perform: session.loadData)
            .navigationBarTitle("Главная")
            .navigationBarItems(leading: Button (action: {
                self.choiseModal = 3
                self.modalView = true
            })
            {
                Image(systemName: "gear")
                    .imageScale(.large)
            },trailing: Button (action: {
                self.choiseModal = 1
                self.modalView = true
            }, label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $modalView, onDismiss: {
                if self.choiseModal == 1 {
                    self.modalView = false
                }
                if self.choiseModal == 2 {
                    self.modalView = false
                }
                if self.choiseModal == 3 {
                    self.modalView = false
                }
            }, content: {
                if self.choiseModal == 1 {
                    listPit(modalView: self.$modalView)
                        .environmentObject(LocationStore())
                }
                if self.choiseModal == 2 {
                    newPit(modalView: self.$modalView)
                        .environmentObject(LocationStore())
                }
                if self.choiseModal == 3 {
                    Setting(modalView: self.$modalView)
                        .environmentObject(LocationStore())
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct listPit: View {
    @Binding var modalView: Bool
    var body: some View {
        NavigationView {
            ScrollView {
                Text("listPit")
            }
        }
    }
}

struct newPit: View {
    
    @EnvironmentObject var session: LocationStore
    @Binding var modalView: Bool
    @State private var geopoint: String = ""
    @State private var name: String = ""
    @State private var razmer: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    func savePit() {
        print("ddd")
        session.addData(nameDB: name, geopoint: geopoint)
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
                        CustomInput(text: self.$longitude, name: "Долгота")
                            .padding(.leading, 5)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
