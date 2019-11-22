//
//  ListItem.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 21.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ListItem: View {
    
    @EnvironmentObject var session: LocationStore
    var name: String
    //var location: CLLocationCoordinate2D
    
    var body: some View {
        HStack {
            NewMapView()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            Text(name)
            //Text(location)
        }
    }
}

struct ListDetails: View {
    
    @EnvironmentObject var session: LocationStore
    var name: String
    //var location: CLLocationCoordinate2D
    
    var body: some View {
        VStack {
            NewMapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            Text(name)
            Spacer()
            //Text(location)
        }
        .navigationBarTitle(Text("Детали"), displayMode: .inline)
    }
}
