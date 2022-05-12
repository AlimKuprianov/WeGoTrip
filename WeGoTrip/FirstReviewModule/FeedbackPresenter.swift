//
//  FeedbackPresenter.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import Foundation


protocol FeedbackViewProtocol {
    func enableContinueButton()
    func disableContinueButton()
    func startAnimatingButton()
    func stopAnimatingButton()
}


protocol FeedbackPresenterProtocol: AnyObject {
    init(view: FeedbackViewProtocol, router: RouterProtocol)
    func didPressContinueButton()
    func didPressNoAnswerButton()
}

final class FeedbackPresenter:FeedbackPresenterProtocol {
    
    var view: FeedbackViewProtocol
    let router: RouterProtocol
    
    init(view: FeedbackViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didPressContinueButton() {
        view.startAnimatingButton()
        router.showAdditionalVC()
        //view.stopAnimatingButton()
    }
    
    func didPressNoAnswerButton() {
        router.popToRoot()
    }
    
    
    
}
