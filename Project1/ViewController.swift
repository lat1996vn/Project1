//
//  ViewController.swift
//  Project1
//
//  Created by Lat on 3/8/19.
//  Copyright © 2019 LAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                print(item)
            }
        }
    }


}

