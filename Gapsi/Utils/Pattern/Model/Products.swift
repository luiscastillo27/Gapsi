//
//  Products.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

struct Product {
    let title: String
    let price: Float
    let image: String
}

extension Product {
    init?(jsonObject: [String: Any]) {
        let title = jsonObject["title"] as? String ?? ""
        let price = jsonObject["price"] as? Float ?? 0.0
        let image = jsonObject["image"] as? String ?? ""
        
        
        self.title = title
        self.price = price
        self.image = image
    }
}
