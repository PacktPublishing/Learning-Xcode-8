//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jak Tiano on 7/14/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonWasPressed(_ sender: AnyObject) {
        if textLabel.text == "" {
            textLabel.text = "Hello World!"
        } else {
            textLabel.text = ""
        }
    }
}
