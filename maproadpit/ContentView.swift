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
import CustomButton
import CustomInput

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
                    ListPit(modalView: self.$modalView)
                        .environmentObject(LocationStore())
                }
                if self.choiseModal == 2 {
                    NewPit(modalView: self.$modalView)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
