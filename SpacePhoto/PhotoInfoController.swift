//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Hazem Mohammed on 10/1/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import Foundation
import UIKit

struct PhotoInfoController {
    
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void)
    {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        
        let query: [String: String] = ["api_key": "DEMO_KEY"]
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data ,let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                
                completion(photoInfo)
                
            } else {
                
                print("Either no data was returned, or data was not serialized.")
                
                completion(nil)
            }
        }
        task.resume()
    }
}
