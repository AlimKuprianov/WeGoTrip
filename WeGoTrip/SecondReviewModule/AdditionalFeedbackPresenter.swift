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
    func showErrorAlertMessage()
    func showDoneAlertMessage()

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
        
}


extension AdditionalFeedbackPresenter: AdditionalFeedbackPresenterProtocol {
    
    func didPressSaveButton(whatsLikeTextView: String,
                            whatWillBeBetterTextView: String) {
        
        networkService.saveFeedBackRequest(
                                           tourRate: rateSlider,
                                           guideRate: rateGuideSlider,
                                           informationRate: rateInformationSlider,
                                           navigationRate: rateNavigationSlider,
                                           firstQuestion: whatsLikeTextView,
                                           secondQuestion: whatWillBeBetterTextView) { [weak self] error in
         
            DispatchQueue.main.async {
                
                if let error = error {
                    self?.view.showErrorAlertMessage()
                } else {
                    self?.view.showDoneAlertMessage()
                }
            }
        }
            print(String(rateSlider),
                  String(rateGuideSlider),
                  String(rateInformationSlider),
                  String(rateNavigationSlider),
              whatsLikeTextView,
              whatWillBeBetterTextView)
        router.popToRoot()
    }
    
    func didPressSkipButton() {
        router.popToRoot()

    }
    
}
