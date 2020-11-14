//
//  ProductService.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

struct ProductService: ProductServiceProtocol {

    func getProducts( completion: @escaping (DataResult<[String : Any]>) -> Void) {
        let request = ProductsRouter.getProducts
        ResponseHandler<[String: Any]>.getGenericResponseData(requester: request) { result in
            switch result {
            case .success(let jsonObject):
                completion(.success(jsonObject))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
   
}


