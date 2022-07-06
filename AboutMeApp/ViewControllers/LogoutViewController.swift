//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Ilya Kozhevnikov on 03.07.2022.
//

import UIKit

class LogoutViewController: UIViewController {

    @IBOutlet var byeMessageLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        byeMessageLabel.text = "Have a nice day, and listen to \(userName)!"
    }
}
