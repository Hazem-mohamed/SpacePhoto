//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Hazem Mohammed on 10/1/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    
    var title: String
    var explanation: String
    var url: URL?
    
     enum Keys: String, CodingKey {
        case title
        case explanation = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:
            Keys.self)
        self.title = try valueContainer.decode(String.self,
                                               forKey: Keys.title)
        self.explanation = try valueContainer.decode(String.self,
                                                     forKey: Keys.explanation)
        self.url = try valueContainer.decode(URL.self, forKey:
            Keys.url)
    }
}
