//
//  IntroViewController.swift
//  AboutMeApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var introLabel: UILabel!
    @IBOutlet var avatarImageView: UIImageView!
    
    var introText = ""
    var avatar = UIImage.init(systemName: "stop")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.image = avatar
        introLabel.text = introText
    }

}
