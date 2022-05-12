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
    init(view: AdditionalFeedbackViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func didPressSaveButton()
    func didPressSkipButton()
}

final class AdditionalFeedbackPresenter {

    
    var view: AdditionalFeedbackViewProtocol
    var networkService: NetworkServiceProtocol
    let router: RouterProtocol
    
    init(view: AdditionalFeedbackViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol) {
        
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    
    
}


extension AdditionalFeedbackPresenter: AdditionalFeedbackPresenterProtocol {
    
    func didPressSaveButton() {
        
        networkService.saveFeedBackRequest(idTrip: <#T##String#>,
                                           tourRate: <#T##String#>,
                                           guideRate: <#T##String#>,
                                           informationRate: <#T##String#>,
                                           navigationRate: <#T##String#>,
                                           firstQuestion: <#T##String#>,
                                           secondQuestion: <#T##String#>)
    }
    
    func didPressSkipButton() {
        print("hello2")

    }
    
}

    
