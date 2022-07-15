//
//  CustomFont.swift
//  CustomDynamicType
//
//  Created by 胡洞明 on 2022-07-14.
//

import UIKit

enum CustomFont: CustomStringConvertible {
    
    static let largeTitle = playfairDisplay(weight: .Bold).font(textStyle: .largeTitle, defaultSize: 40)
    static let headline = robotoMono(weight: .MediumItalic).font(textStyle: .headline)
    
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
