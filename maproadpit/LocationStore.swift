//
//  LocationStore.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 18.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import Firebase

final class LocationStore: ObservableObject {
    
    @Published var latitudeDB: Double!
    @Published var longitudeDB: Double!
    @Published var nameDB: String!
    
    func loadData() {
        let db = Firestore.firestore()
        db.collection("dataPit").document("lbwkJ69WHUf2iKNydeaW")
        .addSnapshotListener { documentSnapshot, error in
            if let document = documentSnapshot {
                let geopoint = document.get("geopoint") as? GeoPoint
                self.latitudeDB = geopoint!.latitude
                self.longitudeDB = geopoint!.longitude
                self.nameDB = document.get("name") as? String
                print(self.latitudeDB!)
                print(self.longitudeDB!)
                print(self.nameDB!)
            } else {
                print("Ошибка")
            }
        }
    }
}
