//
//  FeedbackPresenter.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import Foundation

final class FeedbackPresenter {
    
    var view: ViewProtocol
    let router: RouterProtocol
    
    init(view: ViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
}
