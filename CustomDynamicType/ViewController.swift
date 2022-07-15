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
        
        largeTitleLabel.setFont(CustomFont.largeTitle)
        headlineLabel.setFont(CustomFont.headline)
        
        typealias CT = CustomFont
        
        setFontsOnViews(([largeTitleLabel], CT.largeTitle),
                        ([headlineLabel], CT.headline),
                        ([bodyTextView], CT.headline))
        
        setTextsOnViews((largeTitleLabel, "My Large Title"),
                        (headlineLabel, "My cool headline"),
                        (bodyTextView, "My body content"))
    }


}

