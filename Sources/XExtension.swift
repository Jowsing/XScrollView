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

extension UIView {
    
    class ConstraintsItem {
        
        var top: CGFloat {
            get {
                return self.topItem.constant
            }
            set {
                self.topItem.constant = newValue
            }
        }
        
        var leading: CGFloat {
            get {
                return self.leadingItem.constant
            }
            set {
                self.leadingItem.constant = newValue
            }
        }
        
        var width: CGFloat {
            get {
                return self.widthItem.constant
            }
            set {
                self.widthItem.constant = newValue
            }
        }
        
        var height: CGFloat {
            get {
                return self.heightItem.constant
            }
            set {
                self.heightItem.constant = newValue
            }
        }
        
        private let topItem: NSLayoutConstraint
        private let leadingItem: NSLayoutConstraint
        private let widthItem: NSLayoutConstraint
        private let heightItem: NSLayoutConstraint
        
        init(view: UIView) {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            self.topItem = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: view.superview, attribute: .top, multiplier: 1, constant: 0)
            
            self.leadingItem = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: view.superview, attribute: .leading, multiplier: 1, constant: 0)
            
            self.widthItem = view.widthAnchor.constraint(equalToConstant: 0)
            
            self.heightItem = view.heightAnchor.constraint(equalToConstant: 0)
            
            NSLayoutConstraint.activate([
                self.topItem,
                self.leadingItem,
                self.widthItem,
                self.heightItem,
            ])
        }
        
        func remove() {
            NSLayoutConstraint.deactivate([
                self.topItem,
                self.leadingItem,
                self.widthItem,
                self.heightItem,
            ])
        }
    }    
}
