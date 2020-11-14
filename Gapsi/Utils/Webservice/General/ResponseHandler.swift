//
//  ResponseHandler.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation
import Alamofire

struct ResponseHandler<T> {
    static func getGenericResponseData(requester: URLRequestConvertible, completion: @escaping (DataResult<T>) -> Void){
        Alamofire.request(requester).responseJSON { (response: DataResponse<Any>) in
            
            guard let data = response.data else {
                return completion(.failure(DataError(type: .noData, message: "Error de servidor" )))
            }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? T else {
                return completion(.failure(DataError(type: .invalidJSON, message: "Error de servidor" )))
            }
            
            completion(.success(jsonObject))
        }
    }
}
