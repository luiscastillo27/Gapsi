//
//  ProductViewModel.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation
import Alamofire

struct ProductViewModel {
    
    private let productService: ProductServiceProtocol
    
    init(productService: ProductServiceProtocol = ProductService()){
        self.productService = productService
    }
    
    func getProducts(completion: @escaping (DataResult<[Product]>) -> Void) {
        productService.getProducts() { result in
            switch result {
            case .success(let jsonResponse):
                
                let status = jsonResponse["status"] as? Int ?? 0
                if status == 401 {
                    completion(.failure(DataError(type: .unknown, message: jsonResponse["message"] as? String ?? "")))
                } else {
                    let list = self.getProductArray(from: jsonResponse)
                    completion(.success(list))
                }
                
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    private func getProductArray(from jsonResponse: [String: Any]) -> [Product] {
        guard let data = jsonResponse["items"] as? [[String: Any]] else { return [] }
        var products: [Product] = []
        
        for jsonObject in data {
            if let product = Product(jsonObject: jsonObject) {
                products.append(product)
            }
        }
        
        return products
    }

    
    
    
}
