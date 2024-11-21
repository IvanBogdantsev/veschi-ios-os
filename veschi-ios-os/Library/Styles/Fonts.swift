//  veschi-ios-os
//  Created by Ivan B.

import UIKit

enum Fonts {
    /// 13 regular
    static let footnote = UIFont.preferredFont(forTextStyle: .footnote)
    ///  15 regular
    static let subheadline = UIFont.preferredFont(forTextStyle: .subheadline)
    /// 17 regular
    static let body = UIFont.preferredFont(forTextStyle: .body)
    /// 17 semibold
    static let headline = UIFont.preferredFont(forTextStyle: .headline)
    /// 22 semibold
    static let title = UIFont.preferredFont(forTextStyle: .title2).semibolded()
    /// 48 bold
    static let superLargeTitle = UIFont.systemFont(ofSize: 48).bolded()
    /// 78 regular
    static let emojiHeader = UIFont.systemFont(ofSize: 78)
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
