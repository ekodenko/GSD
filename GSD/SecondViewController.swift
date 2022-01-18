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
    fileprivate func loginAlert () {
        let ac = UIAlertController(title: "Заоегестрированы?", message: "Введите Ваш логин и пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Введите логин"
    }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Введите пароль"
            userPasswordTF.isSecureTextEntry = true
        }
        self.present(ac, animated: true, completion: nil)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://www.mercedesmedic.com/wp-content/uploads/2016/04/mercedes-benz-woman-300x200.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.sync {
                self.image = UIImage(data: imageData)
            }
        }
        }
    }
    
 
