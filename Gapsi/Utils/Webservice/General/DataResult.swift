//
//  DataResult.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

enum DataResult<T> {
    case success(T)
    case failure(DataError)
}
