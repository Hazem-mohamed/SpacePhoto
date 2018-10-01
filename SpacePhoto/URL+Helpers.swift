//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Hazem Mohammed on 10/1/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self,resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{ URLQueryItem(name: $0.0, value: $0.1) }
        print("COMPONENTS URL IS: \(components?.url)")
        return components?.url
    }
}
