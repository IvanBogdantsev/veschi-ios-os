//
//  BaseView.swift
//  veschi-ios-os
//
//  Created by Vanya Bogdantsev on 23.10.2024.
//

import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
        setStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {}
    func setStyles() {}
    
}
