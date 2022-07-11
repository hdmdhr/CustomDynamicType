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
    
}
