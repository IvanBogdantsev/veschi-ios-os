//
//  UIFont.swift
//  veschi-ios
//
//  Created by Vanya Bogdantsev on 12.10.2024.
//

import UIKit

extension UIFont {
    func bolded() -> UIFont {
        return with(traits: .traitBold)
    }

    func italicized() -> UIFont {
        return with(traits: .traitItalic)
    }

    func semibolded() -> UIFont {
        return withWeight(.semibold)
    }

    func lighted() -> UIFont {
        return withWeight(.light)
    }

    private func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: pointSize)
    }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        let descriptor = fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
