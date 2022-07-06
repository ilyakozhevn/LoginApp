//
//  ReleasesViewController.swift
//  AboutMeApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import UIKit

class ReleasesViewController: UIViewController {

    @IBOutlet var albumButtons: [UIButton]!

    var releaseTitles = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitlesForButtons()
        hideExtraButtons()
    }
    
    private func setTitlesForButtons() {
        for (index, title) in releaseTitles.enumerated() {
            if index < albumButtons.count {
                albumButtons[index].setTitle(title, for: .normal)
            }
        }
    }
    
    private func hideExtraButtons() {
        if albumButtons.count > releaseTitles.count {
            for albumIndex in releaseTitles.count..<albumButtons.count {
                albumButtons[albumIndex].isHidden = true
            }
        }
    }
    
//    guard let url = URL(string: "https://stackoverflow.com") else { return }
//    UIApplication.shared.open(url)

}
