//
//  Presenter.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import Foundation


protocol ViewProtocol {
    func enableLaunchButton()
    func disableLaunchButton()
    func startAnimatingButton()
    func stopAnimatingButton()
}


protocol LaunchViewPresenterProtocol: AnyObject {
    init(view: ViewProtocol, router: RouterProtocol)
    func didPressLaunchButton()
}


final class LaunchPresenter: LaunchViewPresenterProtocol {
    
    var view: ViewProtocol
    var router: RouterProtocol
    
    init(view: ViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didPressLaunchButton() {
        router.showAnotherVC()
    }
    
    
}
