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
    func didPressContinueButton(withRateSlider: Int,
                                withRateGuideSlider: Int,
                                withRateInformationSlider: Int,
                                withRateNavigationSlider: Int )
    func didPressNoAnswerButton()
}

final class FeedbackPresenter:FeedbackPresenterProtocol {
    
    var view: FeedbackViewProtocol
    let router: RouterProtocol
    
    init(view: FeedbackViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    

    func didPressContinueButton(withRateSlider: Int,
                                withRateGuideSlider: Int,
                                withRateInformationSlider: Int,
                                withRateNavigationSlider: Int) {
        
        view.startAnimatingButton()
        print(withRateSlider, withRateGuideSlider, withRateInformationSlider, withRateNavigationSlider)
        router.showAdditionalVC(withRateSlider: withRateSlider,
                                withRateGuideSlider: withRateGuideSlider,
                                withRateInformationSlider: withRateInformationSlider,
                                withRateNavigationSlider: withRateNavigationSlider)
    }

    
    func didPressNoAnswerButton() {
        router.popToRoot()
        view.stopAnimatingButton()
        view.enableContinueButton()
    }
    
    
    
}
