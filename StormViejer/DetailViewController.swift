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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageName = selectedImage {
            imageView.image = UIImage(named: imageName)
        }
    }
    
}
