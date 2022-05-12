//
//  ModuleBuilder.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createReview(router: RouterProtocol) -> UIViewController
    func createAdditionalReview(router: RouterProtocol,
                                rateSlider: Int,
                                rateGuideSlider: Int,
                                rateInformationSlider: Int,
                                rateNavigationSlider: Int) -> UIViewController

}

class ModuleBuilder: ModuleBuilderProtocol {
    
    
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = LaunchViewController()
        let presenter = LaunchPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createReview(router: RouterProtocol) -> UIViewController {
        
        let view = FeedbackViewController()
        let presenter = FeedbackPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createAdditionalReview(router: RouterProtocol,
                                rateSlider: Int,
                                rateGuideSlider: Int,
                                rateInformationSlider: Int,
                                rateNavigationSlider: Int) -> UIViewController {
        
        let view = AdditionalFeedbackViewController()
        let networkService = NetworkService()
        let presenter = AdditionalFeedbackPresenter(view: view,
                                                    networkService: networkService,
                                                    router: router,
                                                    rateSlider: rateSlider,
                                                    rateGuideSlider: rateGuideSlider,
                                                    rateInformationSlider: rateInformationSlider,
                                                    rateNavigationSlider: rateNavigationSlider)
        view.presenter = presenter
        return view
    }
}

