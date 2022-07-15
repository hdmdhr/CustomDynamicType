//
//  UIView+SetFont.swift
//  CustomDynamicType
//
//  Created by 胡洞明 on 2022-07-10.
//

import UIKit

extension UIView {
    
    func setFont(_ font: UIFont) {
        if let adjustable = self as? UIContentSizeCategoryAdjusting {
            adjustable.adjustsFontForContentSizeCategory = true
        }
        
        if let label = self as? UILabel {
            label.font = font
        } else if let button = self as? UIButton {
            button.titleLabel?.font = font
        } else if let textField = self as? UITextField {
            textField.font = font
        } else if let textView = self as? UITextView {
            textView.font = font
        } else {
            // add more castings if needed
        }
    }
    
    func setText(_ text: String?) {
        if let label = self as? UILabel {
            label.text = text
        } else if let button = self as? UIButton {
            button.setTitle(text, for: [])
        } else if let textField = self as? UITextField {
            textField.text = text
        } else if let textView = self as? UITextView {
            textView.text = text
        } else {
            // add more castings if needed
        }
    }
    
}



func setFontsOnViews(_ tuples: (views: [UIView], font: UIFont)...) {
    for (views, font) in tuples {
        for view in views {
            view.setFont(font)
        }
    }
}

func setTextsOnViews(_ tuples: (view: UIView, text: String?)...) {
    for (view, text) in tuples {
        view.setText(text)
    }
}
