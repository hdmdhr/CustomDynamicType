# CustomDynamicType
Repository for my Medium article [Use Dynamic Type with Custom Fonts in iOS](https://medium.com/@hdmdhr/use-dynamic-type-with-custom-fonts-in-ios-480d9c902689)

Difficulty Level: Beginner | **Easy** | Normal | Challenging

The content of this article was developed using Xcode 13.4 and Swift 5.

If you prefer a video version of the same content, please take a look at my video tutorial (coming soon)!

## Core logic: `CustomFont` enum

```swift
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

```
