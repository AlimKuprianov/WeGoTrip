//
//  AdditionalFeedbackPresenter.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import Foundation

protocol AdditionalFeedbackViewProtocol {
    func enableContinueButton()
    func disableContinueButton()
    func startAnimatingButton()
    func stopAnimatingButton()
}


protocol AdditionalFeedbackPresenterProtocol: AnyObject {
    init(view: AdditionalFeedbackViewProtocol, router: RouterProtocol)
    func didPressSaveButton()
    func didPressSkipButton()
}

final class AdditionalFeedbackPresenter {

    
    var view: AdditionalFeedbackViewProtocol
    let router: RouterProtocol
    
    init(view: AdditionalFeedbackViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
}


extension AdditionalFeedbackPresenter: AdditionalFeedbackPresenterProtocol {
    
    func didPressSaveButton() {
        print("hello")
    }
    
    func didPressSkipButton() {
        print("hello2")

    }
    
}

    
