//
//  SliderView.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit

class SliderView: UISlider {
     override func trackRect(forBounds bounds: CGRect) -> CGRect {
          var result = super.trackRect(forBounds: bounds)
          result.origin.x = 0
          result.size.width = bounds.size.width
          result.size.height = 1
          return result
     }
}
