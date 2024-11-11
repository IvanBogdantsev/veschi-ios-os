//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AuthView: BaseView {
    
    let stackView = UIStackView(axis: .vertical, spacing: DesignConfiguration.stackViewVerticalSpacing)
    let countryCodeButton = Buttons.leftAligned()
    let telephoneNumberTextField = TextFields.telephoneEntry()
    
    override func layout() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(countryCodeButton, telephoneNumberTextField)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(DesignConfiguration.fullWidthControlElementScreenPercentage)
        }
        countryCodeButton.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.principalActionButtonHeight)
        }
        telephoneNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.textFieldHeight)
        }
    }
    
    override func setStyles() {
        super.setStyles()
    }
    
}
