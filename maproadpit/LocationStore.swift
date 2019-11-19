//
//  LocationStore.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 18.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI
import Firebase
import CoreLocation

final class LocationStore: ObservableObject {
    
    @Published var dataLocation = [DataLocation]()
    
    func loadData() {
        let db = Firestore.firestore()
        db.collection("dataPit").document("listPit").collection("pit")
            .addSnapshotListener { (querySnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in querySnapshot!.documentChanges {
                if i.type == .added {
                    let geopoint = i.document.get("geopoint") as? GeoPoint
                    let latitudeDB = geopoint!.latitude
                    let longitudeDB = geopoint!.longitude
                    let locationDB = CLLocationCoordinate2D(latitude: latitudeDB, longitude: longitudeDB)
                    let nameDB = i.document.get("nameDB") as? String
                    let id = i.document.documentID
                    self.dataLocation.append(DataLocation(id: id, nameDB: nameDB!, locationDB: locationDB))
                    print(self.dataLocation)
                }
            }
        }
    }
}

struct DataLocation: Equatable {
    
    static func == (lhs: DataLocation, rhs: DataLocation) -> Bool {
        lhs.id == rhs.id
    }    
    var id: String
    var nameDB: String
    var locationDB: CLLocationCoordinate2D
}
