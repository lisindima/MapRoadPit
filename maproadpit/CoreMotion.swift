//
//  CoreMotion.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 22.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import Foundation
import Combine
import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager
    private var userAcceleration: CMAcceleration

    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    @Published var xAcceleration: Double = 0.0
    @Published var yAcceleration: Double = 0.0
    @Published var zAcceleration: Double = 0.0

    init() {
        self.userAcceleration = CMAcceleration()
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 1/60
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            self.xAcceleration = self.userAcceleration.x
            self.yAcceleration = self.userAcceleration.y
            self.zAcceleration = self.userAcceleration.z
            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }

        }

    }
}

struct MotionTest: View {

    @ObservedObject var motion: MotionManager

    var body: some View {
        VStack {
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
            Text("X: \(motion.xAcceleration)")
            Text("Y: \(motion.yAcceleration)")
            Text("Z: \(motion.zAcceleration)")
            
        }
    }
}
