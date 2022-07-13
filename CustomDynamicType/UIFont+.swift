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


enum CustomFont: CustomStringConvertible {
    
    case robotoMono(weight: RobotoMonoWeight)
    case playfairDisplay(weight: PlayfairDisplayWeight)
    
    var description: String {
        switch self {
        case .robotoMono: return "RobotoMono"
        case .playfairDisplay: return "PlayfairDisplay"
        }
    }
    
    var weight: String {
        switch self {
        case .robotoMono(let weight): return weight.rawValue
        case .playfairDisplay(let weight): return weight.rawValue
        }
    }
    
    enum PlayfairDisplayWeight: String {
        case Regular, Italic
        case Medium, SemiBold, Bold, ExtraBold, Black
        case MediumItalic, SemiBoldItalic, BoldItalic, ExtraBoldItalic, BlackItalic
    }
    
    enum RobotoMonoWeight: String {
        case ExtraLight, Thin, Light
        case ExtraLightItalic, ThinItalic, LightItalic
        case Regular, Italic
        case Medium, Bold, SemiBold
        case MediumItalic, BoldItalic, SemiBoldItalic
    }
    
    func font(textStyle: UIFont.TextStyle, defaultSize: CGFloat? = nil) -> UIFont {
        // 1
        let fontName = [description, weight].joined(separator: "-")
        // 2
        let size = defaultSize ?? UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).pointSize
        // 3
        let fontToScale = UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
        // 4
        return textStyle.metrics.scaledFont(for: fontToScale)
    }
    
}
