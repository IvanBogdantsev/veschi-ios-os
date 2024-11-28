//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AuthView: BaseView {
    
    let telephoneAuthVStackView = UIStackView(
        axis: .vertical,
        spacing: DesignConfiguration.stackViewVerticalSpacing
    )
    let emojiHeaderLabel = Labels.emojiHeader(text: Emojis.telephone)
    let titleLabel = Labels.title(text: Strings.throw_your_number)
    let subtitleLabel = Labels.body(text: Strings.to_create_an_account_or_sign_in)
    let countryCodeButton = Buttons.leftAligned()
    let telephoneNumberTextField = TextFields.telephoneNumberEntry()
    let sendButton = Buttons.mainAction(title: Strings.send_me_the_code)
    
    let thirdPartyAuthVSStackView = UIStackView(
        axis: .vertical,
        spacing: DesignConfiguration.stackViewVerticalSpacing / 2,
        distribution: .fillEqually
    )
    let googleSignInButton = Buttons.googleSignIn()
    let appleSignInButton = Buttons.appleSignIn()
    
    override func layout() {
        super.layout()
        addSubviews(telephoneAuthVStackView, thirdPartyAuthVSStackView)
        
        // MARK: telephone auth block
        telephoneAuthVStackView.addArrangedSubviews(
            emojiHeaderLabel,
            titleLabel,
            subtitleLabel,
            countryCodeButton,
            telephoneNumberTextField,
            sendButton
        )
        telephoneAuthVStackView.snp.makeConstraints { make in
            make.bottom.equalTo(snp.centerY).offset(
                DesignConfiguration.textFieldHeight +
                DesignConfiguration.textFieldHeight +
                DesignConfiguration.principalActionButtonHeight
            )
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(
                DesignConfiguration.fullWidthControlElementScreenPercentage
            )
        }
        countryCodeButton.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.textFieldHeight)
        }
        telephoneNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.textFieldHeight)
        }
        sendButton.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.principalActionButtonHeight)
        }
        
        // MARK: third party auth block
        thirdPartyAuthVSStackView.addArrangedSubviews(
            googleSignInButton,
            appleSignInButton
        )
        thirdPartyAuthVSStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(telephoneAuthVStackView.snp.bottom).offset(
                DesignConfiguration.stackViewVerticalSpacing * 2
            )
            make.width.equalToSuperview().multipliedBy(
                DesignConfiguration.fullWidthControlElementScreenPercentage
            )
        }
        googleSignInButton.snp.makeConstraints { make in
            make.height.equalTo(DesignConfiguration.secondaryActionButtonHeight)
        }
    }
    
    override func setStyles() {
        super.setStyles()
    }
    
}
