//
//  ViewController.swift
//  Gestures
//
//  Created by Jak Tiano on 8/16/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var pinchGesture: UIPinchGestureRecognizer!
    var image = UIImage(named: "wink")
    var flipped: Bool = false {
        didSet {
            if flipped {
                let temp = UIImage(cgImage: image!.cgImage!, scale: 1.0, orientation: .downMirrored)
                imageView.image = temp
            } else {
                imageView.image = image
            }
        }
    }

    var lastScale: CGFloat = 1;
    var currentScale: CGFloat = 1;
    var startWidth: CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch(_:)))
        view.addGestureRecognizer(pinchGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        startWidth = imageView.frame.size.width
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        view.removeGestureRecognizer(pinchGesture)
        pinchGesture = nil
    }

    func pinch(_ pinch: UIPinchGestureRecognizer) {
        
        if (pinch.state == .began) {
            lastScale = 1
        } else if (pinch.state == .changed) {
            let delta = pinch.scale - lastScale
            currentScale += delta
            lastScale = pinch.scale
        }
        updateImageSize()
    }
    
    func updateImageSize() {
        for constraint in imageView.constraints {
            if constraint.identifier == "widthConstraint" {
                constraint.constant = startWidth * currentScale
                break
            }
        }
    }
    
    @IBAction func flipImage(_ sender: AnyObject) {
        flipped = !flipped
    }
}
