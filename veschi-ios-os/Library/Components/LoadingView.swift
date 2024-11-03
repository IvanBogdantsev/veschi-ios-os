//  veschi-ios-os
//  Created by Ivan B.

import SnapKit
import UIKit

final class LoadingView: UIView {
    
    var activityIndicatorView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .red.withAlphaComponent(0.1)
        activityIndicatorView.style = .large
        activityIndicatorView.hidesWhenStopped = true
        addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
