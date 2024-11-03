//
//  Fonts.swift
//
//
//  Created by Vanya Bogdantsev on 20.08.2023.
//

import UIKit

enum Fonts {
    /// 13 regular
    static let footnote = UIFont.preferredFont(forTextStyle: .footnote)
    /// 17 regular
    static let body = UIFont.preferredFont(forTextStyle: .body)
    /// 17 semibold
    static let headline = UIFont.preferredFont(forTextStyle: .headline)
    ///  15 regular
    static let subheadline = UIFont.preferredFont(forTextStyle: .subheadline)
    /// 48 bold
    static let logoTitle = UIFont.systemFont(ofSize: 48, weight: .bold)
}

fileprivate extension UIFont {
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
