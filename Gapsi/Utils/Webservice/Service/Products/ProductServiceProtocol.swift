//
//  ProductServiceProtocol.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

protocol ProductServiceProtocol {
    func getProducts(completion: @escaping (DataResult<[String: Any]>) -> Void)
}
