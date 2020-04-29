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
        
        // Add bar button for share image
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))

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
    
    // MARK: - Shares image
    @objc func sharedTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.80) else {
            print("Not found image")
            return }
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}
