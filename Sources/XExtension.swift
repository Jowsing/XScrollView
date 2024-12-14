//
//  CGFloat+Pixel.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import UIKit

extension CGFloat {
    
    var pixel: Int {
        return Int(self * UIScreen.main.scale)
    }
}

extension CGSize {
    
    var pixel: (w: Int, h: Int) {
        return (self.width.pixel, self.height.pixel)
    }
}
