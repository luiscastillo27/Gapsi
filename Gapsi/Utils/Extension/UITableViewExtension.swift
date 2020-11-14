//
//  UITableViewExtension.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import UIKit

extension UITableView {
    
    // Configuración por defecto de una tabla
    func configure(owner: UIViewController) {
        tableFooterView = UIView()
        //separatorStyle = .none
        dataSource = owner as? UITableViewDataSource
        self.delegate = owner as? UITableViewDelegate
    }
    
}
