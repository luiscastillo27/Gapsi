//
//  StringExtension.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedUppercased() -> String {
        return localized().uppercased()
    }
    
    func localizedLowercased() -> String {
        return localized().lowercased()
    }
    
}
