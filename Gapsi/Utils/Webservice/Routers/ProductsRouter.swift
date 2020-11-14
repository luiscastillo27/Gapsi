//
//  ProductsRouter.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation
import Alamofire

enum ProductsRouter: URLRequestConvertible {
    
    case getProducts
    
    var method: HTTPMethod {
        switch self {
            case .getProducts:
                return .get
        }
    }
    
    var path: String {
        switch self {
            case .getProducts:
                return ""
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
            case .getProducts:
                return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIManager.baseUrl.asURL()
        
        switch self {
        case .getProducts:
            //let token = APIManager.token
            var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
            urlRequest.httpMethod = method.rawValue
            urlRequest.setValue(ContentType.urlEncoded.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            urlRequest.setValue(ContentType.IBMTOKEN.rawValue, forHTTPHeaderField: HTTPHeaderField.IBMClient.rawValue)
            print(urlRequest)
            return urlRequest
        }
    }
}
