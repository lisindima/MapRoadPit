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
import CoreMotion

struct ContentView: View {
    
    @EnvironmentObject var session: LocationStore    
    @State private var selectedLandmark: DataLocation? = nil
    @State private var modalView: Bool = false
    @State private var choiseModal: Int = 1
    
    func funcSplashScreen() {
        let defaults = UserDefaults.standard
            if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
                print("НЕ первый запуск")
                self.modalView = false
            }else{
                defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
                print("Первый запуск")
                self.choiseModal = 4
                self.modalView = true
        }
    }
    
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
                    self.choiseModal = 1
                }
                if self.choiseModal == 2 {
                    self.modalView = false
                    self.choiseModal = 1
                }
                if self.choiseModal == 3 {
                    self.modalView = false
                    self.choiseModal = 1
                }
                if self.choiseModal == 4 {
                    self.modalView = false
                    self.choiseModal = 1
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
                if self.choiseModal == 4 {
                    SplashScreen()
                }
            })
        }
        .onAppear(perform: funcSplashScreen)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
