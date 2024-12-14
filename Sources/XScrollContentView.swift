//
//  XScrollContentView.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import UIKit

final class XScrollContentView: UIView {
    
    // MARK: - Property (assign)
    
    private(set) var fitsMaxSize = CGSize.zero {
        didSet {
            if self.fitsMaxSize.pixel != oldValue.pixel {
                self.fitsMaxSizeUpdateHandler?()
            }
        }
    }
    
    // MARK: - Property (retain)
    
    var fitsMaxSizeUpdateHandler: (() -> Void)?
    
    // MARK: - Property (lazy)
    
    lazy var constraintsItem = ConstraintsItem(view: self)
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateFitsMaxSize()
    }
    
    private func updateFitsMaxSize() {
        var maxX = self.bounds.width
        var maxY = self.bounds.height
        self.subviews.forEach {
            let rect = $0.frame
            let rectMaxX = rect.maxX
            let rectMaxY = rect.maxY
            if rectMaxX > maxX {
                maxX = rectMaxX
            }
            if rectMaxY > maxY {
                maxY = rectMaxY
            }
        }
        self.fitsMaxSize = CGSize(width: maxX, height: maxY)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if self.window != nil {
            self.updateFitsMaxSize()
        }
    }
}
