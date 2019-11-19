//
//  ContentView.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 12.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @EnvironmentObject var session: LocationStore    
    @State var landmarks = [DataLocation]()
    
    @State private var selectedLandmark: DataLocation? = nil
    @State private var longer: Bool = false
    @State private var modalView: Bool = false
    @State private var choiseModal: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(landmarks: $landmarks, selectedLandmark: $selectedLandmark)
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
            .sheet(isPresented: $modalView) {
                if self.choiseModal == 1 {
                    listPit()
                }
                if self.choiseModal == 2 {
                    newPit()
                }
                if self.choiseModal == 3 {
                    Setting(modalView: self.$modalView)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct listPit: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("listPit")
            }
        }
    }
}

struct newPit: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("newPit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
