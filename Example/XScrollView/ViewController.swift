//
//  ViewController.swift
//  XScrollView
//
//  Created by jowsing on 12/14/2024.
//  Copyright (c) 2024 jowsing. All rights reserved.
//

import UIKit
import XScrollView
import SnapKit

class ViewController: UIViewController {
    
    private let label = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scrollView = XScrollView(frame: .zero)
        scrollView.autoScrollDirection = .vertical
        scrollView.backgroundColor = .red
        scrollView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            if #available(iOS 11.0, *) {
                make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            } else {
                // Fallback on earlier versions
            }
        }
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .green
        titleLabel.text = "我是标题"
        titleLabel.font = .systemFont(ofSize: 19, weight: .medium)
        scrollView.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(15)
        }
        
        scrollView.addArrangedSubview(label)
        
        label.text = "内容如下 -> "
        label.backgroundColor = .green
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.right.equalTo(0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let str = label.text ?? ""
        label.text = str + "动画都好好的护肤v把vvv叔叔说的方法叔叔是地地道道的房东"
    }

}

