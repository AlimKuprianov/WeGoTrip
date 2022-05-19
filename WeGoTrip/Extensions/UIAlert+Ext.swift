//
//  UIAlert+Ext.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 19.05.2022.
//

import UIKit


extension UIViewController {
    
    public func showAlert(withMessage message: String, actionHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: actionHandler)
        alert.addAction(action)

    }
    
}
