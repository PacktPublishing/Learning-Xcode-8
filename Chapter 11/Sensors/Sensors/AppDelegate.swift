//
//  AppDelegate.swift
//  Sensors
//
//  Created by Jak Tiano on 9/27/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate  {

    var session: WCSession?
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }
    public func sessionDidDeactivate(_ session: WCSession) {
        return
    }
    public func sessionDidBecomeInactive(_ session: WCSession) {
        return
    }
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        session = WCSession.default()
        session?.delegate = self
        session?.activate()

        return true
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let data = message["data"] as? Double {
            let vc = window?.rootViewController as! ViewController
            vc.addChartPoint(data: data)
        }
    }
}
