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
    
    init() {
        loadData()
    }
    
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
                    let latitudeDB = i.document.get("latitude") as? Double
                    let longitudeDB = i.document.get("longitude") as? Double
                    let locationDB = CLLocationCoordinate2D(latitude: latitudeDB ?? 0.0, longitude: longitudeDB ?? 0.0)
                    let nameDB = i.document.get("nameDB") as? String
                    let id = i.document.documentID
                    self.dataLocation.append(DataLocation(id: id, nameDB: nameDB!, locationDB: locationDB))
                    print(self.dataLocation)
                }
            }
        }
    }
    
    func addData(nameDB: String, latitude: Double, longitude: Double) {
        let db = Firestore.firestore()
        db.collection("dataPit").document("listPit").collection("pit").addDocument(data: ["nameDB": nameDB, "latitude": latitude, "longitude": longitude]) { (err) in
        if err != nil {
            print((err?.localizedDescription)!)
            return
        }
            print("success")
        }
    }
    
    func deleteData(id: String) {
        let db = Firestore.firestore()
        db.collection("dataPit").document("listPit").collection("pit").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}

struct DataLocation: Identifiable {
        
    var id: String
    var nameDB: String
    var locationDB: CLLocationCoordinate2D
}
