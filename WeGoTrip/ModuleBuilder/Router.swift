//
//  Router.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showAnotherVC()
    func showAdditionalVC()
    func popToRoot()
}


class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            let mainViewController = moduleBuilder.createMain(router: self)
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showAnotherVC() {
        if let navigationController = navigationController {
            let reviewViewController = moduleBuilder.createReview(router: self)
            navigationController.pushViewController(reviewViewController, animated: true)
        }
    }
    
    func showAdditionalVC() {
        if let navigationController = navigationController {
            let additionalViewController = moduleBuilder.createAdditionalReview(router: self)
            navigationController.pushViewController(additionalViewController, animated: true)
        }
    }
        
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    
}


