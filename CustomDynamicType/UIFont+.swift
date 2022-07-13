//
//  UIFont+.swift
//  CustomDynamicType
//
//  Created by 胡洞明 on 2022-07-10.
//

import UIKit

extension UIFont {
    
    class func preferredFont(forTextStyle style: UIFont.TextStyle, weight: Weight, size: CGFloat? = nil) -> UIFont {
        // 1
        let metrics = UIFontMetrics(forTextStyle: style)
        // 2
        let descriptor = preferredFont(forTextStyle: style).fontDescriptor
        let defaultSize = descriptor.pointSize
        // 3
        let fontToScale = UIFont.systemFont(ofSize: size ?? defaultSize, weight: weight)
        // 4
        return metrics.scaledFont(for: fontToScale)
    }
    
}


enum CustomFont: String {
    
    case RobotoMono
    case PlayfairDisplay
    
    enum Weight: String {
        case ExtraLight, Thin, Light
        case ExtraLightItalic, ThinItalic, LightItalic
        case Regular, Italic
        case Medium, Bold, SemiBold, ExtraBold, Black
        case MediumItalic, BoldItalic, SemiBoldItalic, ExtraBoldItalic, BlackItalic
    }
    
    func font(textStyle: UIFont.TextStyle, weight: Weight = .Regular, defaultSize: CGFloat? = nil) -> UIFont {
        // 1
        let fontName = [rawValue, weight.rawValue].joined(separator: "-")
        // 2
        let size = defaultSize ?? UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).pointSize
        // 3
        let fontToScale = UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
        // 4
        return textStyle.metrics.scaledFont(for: fontToScale)
    }
    
}
