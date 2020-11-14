//
//  APIManager.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

struct APIManager {
    static let baseUrl = "https://00672285.us-south.apigw.appdomain.cloud/demo-gapsi/search?&query=\(Singelton.manager.currentSearch)"
    static let token = "7cb89f3e-6b59-4166-9f01-68e56a3fead8"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case IBMClient = "X-IBM-Client-Id"
}

enum ContentType: String {
    case json = "application/json"
    case IBMTOKEN = "7cb89f3e-6b59-4166-9f01-68e56a3fead8"
    case urlEncoded = "application/x-www-form-urlencoded"
}
