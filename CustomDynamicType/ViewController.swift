//
//  ViewController.swift
//  CustomDynamicType
//
//  Created by 胡洞明 on 2022-07-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var largeTitleLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadLabel: UILabel!
    @IBOutlet weak var titleLabe: UILabel!
    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var footnoteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeTitleLabel.setFont(CustomFont.PlayfairDisplay.font(textStyle: .largeTitle, weight: .MediumItalic))
    }


}

