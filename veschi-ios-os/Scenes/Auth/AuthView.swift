//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AuthView: BaseView {
    
    let stackView = UIStackView(axis: .vertical, spacing: DesignConfiguration.stackViewVerticalSpacing)
    let emojiHeaderLabel = Labels.emojiHeader(text: Emojis.telephone)
    let titleLabel = Labels.title(text: Strings.throw_your_number)
    let subtitleLabel = Labels.body(text: Strings.to_create_an_account_or_sign_in)
    let countryCodeButton = Buttons.leftAligned()
    let telephoneNumberTextField = TextFields.telephoneNumberEntry()
    
    override func layout() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(
            emojiHeaderLabel,
            titleLabel,
            subtitleLabel,
            countryCodeButton,
            telephoneNumberTextField
        )
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(snp.centerY).offset(
                DesignConfiguration.principalActionButtonHeight + DesignConfiguration.textFieldHeight
            )
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(
                DesignConfiguration.fullWidthControlElementScreenPercentage
            )
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
