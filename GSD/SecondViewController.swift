 //
//  File.swift
//  GSD
//
//  Created by Admin on 18.01.2022.
//  Copyright © 2022 Admin. All rights reserved.
//
 
 import UIKit
 
 class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://www.mercedesmedic.com/wp-content/uploads/2016/04/mercedes-benz-woman-300x200.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else {return}
            self.image = UIImage(data: imageData)
        }
    }
    
 
