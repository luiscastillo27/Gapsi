//
//  UIViewControllerExtension.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import UIKit

extension UIViewController {
    
    func embedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    public func hendlerError( this: UIViewController, complete: @escaping ((String) -> Void)) {
        let alert = UIAlertController(title: "ALERT_ERROR".localized(), message: "ALERT_ERROR_BODY".localized(), preferredStyle: .alert)
        let acept = UIAlertAction(title: "KEYBOARD_OK".localized(), style: .default, handler: { (action) in
            complete("acept")
        })
        alert.addAction(acept)
        this.present(alert, animated: true, completion: nil)
    }
    
}
