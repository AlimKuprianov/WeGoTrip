//
//  ViewController+ext.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import UIKit

extension UIViewController {
    func endEditingWhenTapped() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
        gesture.cancelsTouchesInView = false
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        !(touch.view is UIControl)
    }
}
