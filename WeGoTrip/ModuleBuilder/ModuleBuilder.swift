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
    func createAdditionalReview(router: RouterProtocol) -> UIViewController

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
    
    func createAdditionalReview(router: RouterProtocol) -> UIViewController {
        let view = AdditionalFeedbackViewController()
        let presenter = AdditionalFeedbackPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

