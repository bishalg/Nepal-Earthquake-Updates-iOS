//
//  GraphVC.swift
//  Nepal Earthquake Updates
//
//  Created by Leapfrog on 7/1/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

// Foundation
import Foundation
import UIKit

// Model
// Quake

@objc(GraphVC)
class GraphVC: UIViewController {
    @objc var quakes: NSArray = []
    @objc var name : NSString = "name"

    override func viewDidLoad() {
        NSLog("quakes = ",quakes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}