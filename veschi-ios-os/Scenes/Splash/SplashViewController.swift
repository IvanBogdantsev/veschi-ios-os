//
//  SplashViewController.swift
//
//
//  Created by  Ivan B  on 27.05.22.
//
//

import UIKit

final class SplashViewController: UIViewController {
    
    private let label = Labels.logoTitle(text: "\(Strings.veschi) \(Emojis.package)")
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setStyles()
    }
    
    private func layout() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(40)
        }
    }
    
    private func setStyles() {
        view.backgroundColor = Colors.background
    }
    
}
