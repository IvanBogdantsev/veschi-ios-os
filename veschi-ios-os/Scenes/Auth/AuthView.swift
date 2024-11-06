//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AuthView: BaseView {
    
    let countryCodeButton = Buttons.leftAligned()
    
    override func layout() {
        addSubviews(countryCodeButton)
        
        countryCodeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(DesignConfiguration.principalActionButtonHeight)
            make.width.equalToSuperview().multipliedBy(DesignConfiguration.fullWidthControlElementScreenPercentage)
        }
    }
    
    override func setStyles() {
        backgroundColor = Colors.background
    }
    
}
