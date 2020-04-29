//
//  DetailViewController.swift
//  StormViejer
//
//  Created by Alejandro Barranco on 28/04/20.
//  Copyright © 2020 Alejandro Barranco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    

     // MARK: -   Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageName = selectedImage {
            imageView.image = UIImage(named: imageName)
            
            title = imageName
        }
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
