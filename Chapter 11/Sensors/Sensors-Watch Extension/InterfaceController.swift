//
//  InterfaceController.swift
//  Sensors-Watch Extension
//
//  Created by Jak Tiano on 10/10/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate  {

    var session: WCSession?
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }

    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        session = WCSession.default()
        session?.delegate = self
        session?.activate()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.5
            motionManager.startAccelerometerUpdates(to: motionQueue, withHandler: onAccelerometerUpdate)
        }
    }
    
    func onAccelerometerUpdate(data: CMAccelerometerData?, error: Error?) {
        if error == nil, let d = data {
            sendDataToiOS(data: d.acceleration.x)
        } else {
            print("Error: \(error?.localizedDescription)")
        }
    }
    
    func sendDataToiOS(data: Double) {
        let info: [String: Any] = ["data" : data]
        session?.sendMessage(info, replyHandler: nil, errorHandler: nil)
    }

    
    override func willActivate() {
        super.willActivate()
    }
    override func didDeactivate() {
        super.didDeactivate()
    }
}
