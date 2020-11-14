//
//  UILabelExtension.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import UIKit

extension UILabel {
    
    func primary() {
        self.tintColor = .primaryColor
        self.font = UIFont.systemFont(ofSize: 15)
    }
    
    func secondary() {
        self.textColor = .secudaryColor
        self.font = UIFont.systemFont(ofSize: 13)
    }
    
    func center() {
        textAlignment = .center
    }
    
}
