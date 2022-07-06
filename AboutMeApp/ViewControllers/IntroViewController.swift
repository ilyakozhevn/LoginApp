//
//  IntroViewController.swift
//  AboutMeApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var introLabel: UILabel!
    
    var introText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel.text = introText
    }

}
