//
//  XScrollView.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import UIKit
import SnapKit

public class XScrollView: UIScrollView {
    
    public enum ScrollDirection : Int {
        
        case vertical = 0

        case horizontal = 1
    }
    
    // MARK: - Property (override)
    
    public override var contentInset: UIEdgeInsets {
        didSet {
            if contentInset != oldValue {
                self.updateFitsSize()
            }
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return self.fitsSize
    }
    
    // MARK: - Property (assign)
    
    public var autoScrollDirection: ScrollDirection = .vertical
    
    private var pixelSize: (width: Int, height: Int) = (0, 0) {
        didSet {
            if self.pixelSize != oldValue {
                self.updateFitsSize()
            }
        }
    }
    
    private var fitsSize = CGSize.zero {
        didSet {
            if self.fitsSize != oldValue {
                self.updateSizeConstraints()
                self.invalidateIntrinsicContentSize()
            }
        }
    }
        
    
    // MARK: - Property (retain)
    
    public var contentBackgroundColor: UIColor? {
        didSet {
            self.contentView.backgroundColor = contentBackgroundColor
        }
    }
    
    private let contentView = XScrollContentView()
    
    
    // MARK: - Life Cycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addArrangedSubview(_ view: UIView) {
        self.contentView.addSubview(view)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if self.autoScrollDirection == .horizontal {
            self.pixelSize = (0, bounds.height.pixel)
        } else {
            self.pixelSize = (bounds.width.pixel, 0)
        }
    }
    
    public func setupUI() {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
        self.addSubview(contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.left.equalTo(0)
            make.width.equalTo(0)
            make.height.equalTo(0)
        }
        self.contentView.fitsMaxSizeUpdateHandler = { [weak self] in
            self?.updateFitsSize()
        }
    }
        
    private func updateFitsSize() {
        let width = self.pixelSize.width == 0 ? contentInset.left + contentView.fitsMaxSize.width + contentInset.right : bounds.width
        let height = self.pixelSize.height == 0 ? contentInset.top + contentView.fitsMaxSize.height + contentInset.bottom : bounds.height
        self.fitsSize = CGSize(width: width, height: height)
    }
    
    private func updateSizeConstraints() {
        self.contentSize = CGSize(width: fitsSize.width - (contentInset.left + contentInset.right),
                                  height: fitsSize.height - (contentInset.top + contentInset.bottom))
        self.contentView.snp.updateConstraints { make in
            make.size.equalTo(contentSize)
        }
    }
}
