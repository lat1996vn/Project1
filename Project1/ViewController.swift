//
//  ViewController.swift
//  Project1
//
//  Created by Lat on 3/8/19.
//  Copyright © 2019 LAT. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var picture = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ImageView"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                picture.append(item)
            }
        }
        print(picture)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picture[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = picture[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

