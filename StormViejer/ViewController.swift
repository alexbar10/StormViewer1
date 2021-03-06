//
//  ViewController.swift
//  StormViejer
//
//  Created by Alejandro Barranco on 28/04/20.
//  Copyright © 2020 Alejandro Barranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nss") {
                pictures.append(item)
            }
        }
        
        print(pictures)
        tableView.reloadData()
        
        title = "Storm Viewer"
    
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add bar button for recommends the app
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendApp))
    }
    
    @objc func recommendApp() {
        let vc = UIActivityViewController(activityItems: ["Use this app:)"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}


/**
 Extension for tableview methods
 */
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCellIdentifier", for: indexPath) as! CustomTableViewCell
        
        cell.pictureTitleLabel.text = pictures[indexPath.row]
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get destination vc
        guard let destinationVC = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController else {
            return
        }
        
        // Set image to show
        destinationVC.selectedImage = pictures[indexPath.row]
        
        // Push to detail vc
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureTitleLabel: UILabel!
}
