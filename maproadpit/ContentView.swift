//
//  ContentView.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 12.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Equatable {
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID().uuidString
    let name: String
    let location: CLLocationCoordinate2D
}

struct ContentView: View {
    @EnvironmentObject var session: LocationStore
    @State var landmarks: [Landmark] = [
        Landmark(name: "Sydney Harbour Bridge", location: .init(latitude: -33.852222, longitude: 151.210556)),
        Landmark(name: "Brooklyn Bridge", location: .init(latitude: 40.706, longitude: -73.997)),
        Landmark(name: "Golden Gate Bridge", location: .init(latitude: 37.819722, longitude: -122.478611))
    ]
    
    @State private var selectedLandmark: Landmark? = nil
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
                Image(systemName: "info.circle.fill")
                    .imageScale(.large)
            },trailing: Button (action: {
                self.choiseModal = 1
                self.modalView = true
            }, label: {
                Image(systemName: "line.horizontal.3.decrease.circle.fill")
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
                    infoAPP()
                }
            }
        }
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
