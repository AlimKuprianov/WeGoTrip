//
//  Model.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import Foundation

struct Model: Codable {
    var idTrip: UUID
    var tourRate: Int = 2
    var guideRate: Int = 2
    var informationRate: Int = 2
    var navigationRate: Int = 2
    var firstQuestion: String = ""
    var secondQuestion: String = ""
}
