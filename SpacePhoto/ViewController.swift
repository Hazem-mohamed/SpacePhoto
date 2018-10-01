//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Hazem Mohammed on 10/1/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import UIKit
// FINAL UPDATE :D :D 
class ViewController: UIViewController {
    
    
    @IBOutlet weak var spaceImage: UIImageView!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DescriptionLabel.text = ""
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            
            DispatchQueue.main.async {
                
                if let photoInfo = photoInfo {
                    
                    self.DescriptionLabel.text = photoInfo.explanation
                    self.updateUI(with: photoInfo)
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    private func updateUI(with photoInfo: PhotoInfo) {
        
        let task = URLSession.shared.dataTask(with: photoInfo.url!,completionHandler: { (data, response, error) in
            
            if let data = data,let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.DescriptionLabel.text = photoInfo.title
                    self.spaceImage.image = image
                }
            }
        })
        task.resume()
    }
    
}

