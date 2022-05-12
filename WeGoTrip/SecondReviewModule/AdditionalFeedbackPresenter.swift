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
    init(view: AdditionalFeedbackViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         rateSlider: Int,
         rateGuideSlider: Int,
         rateInformationSlider: Int,
         rateNavigationSlider: Int)
    
    func didPressSaveButton(whatsLikeTextView: String,
                            whatWillBeBetterTextView: String)
    
    func didPressSkipButton()
}

final class AdditionalFeedbackPresenter {

    
    var view: AdditionalFeedbackViewProtocol
    var networkService: NetworkServiceProtocol
    let router: RouterProtocol
    
    let rateSlider: Int
    let rateGuideSlider: Int
    let rateInformationSlider: Int
    let rateNavigationSlider: Int
    
    init(view: AdditionalFeedbackViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         rateSlider: Int,
         rateGuideSlider: Int,
         rateInformationSlider: Int,
         rateNavigationSlider: Int) {
        
        self.view = view
        self.networkService = networkService
        self.router = router
        self.rateSlider = rateSlider
        self.rateGuideSlider = rateGuideSlider
        self.rateInformationSlider = rateInformationSlider
        self.rateNavigationSlider = rateNavigationSlider
    }
    
    var idTrip = Int.random(in: 1..<100)
    
}


extension AdditionalFeedbackPresenter: AdditionalFeedbackPresenterProtocol {
    
    func didPressSaveButton(whatsLikeTextView: String,
                            whatWillBeBetterTextView: String) {
        
        
        networkService.saveFeedBackRequest(idTrip: String(idTrip),
                                           tourRate: String(rateSlider),
                                           guideRate: String(rateGuideSlider),
                                           informationRate: String(rateInformationSlider),
                                           navigationRate: String(rateNavigationSlider),
                                           firstQuestion: whatsLikeTextView,
                                           secondQuestion: whatWillBeBetterTextView)
        
        print(String(rateSlider),
              String(rateGuideSlider),
              String(rateInformationSlider),
              String(rateNavigationSlider),
              whatsLikeTextView,
              whatWillBeBetterTextView)
    }
    
    func didPressSkipButton() {
        router.popToRoot()

    }
    
}

    
