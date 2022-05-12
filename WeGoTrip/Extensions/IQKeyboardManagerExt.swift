//
//  IQKeyboardManagerExt.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import UIKit
import IQKeyboardManagerSwift

extension IQKeyboardManager {
    static func configure() {
        shared.enableAutoToolbar = true
        shared.enabledDistanceHandlingClasses = [AdditionalFeedbackViewController.self]
        shared.keyboardDistanceFromTextField = CGFloat(16)
        shared.shouldShowToolbarPlaceholder = false
        //shared.disabledToolbarClasses = [CityPickerViewController.self]
    }
}
