//
//  ReleaseViewController.swift
//  AboutMeApp
//
//  Created by Ilya Kozhevnikov on 07.07.2022.
//

import UIKit

class ReleaseViewController: UIViewController {
    @IBOutlet var topNavigationItem: UINavigationItem!
    @IBOutlet var artworkImageView: UIImageView!
    @IBOutlet var tracksLabel: UILabel!
    @IBOutlet var linkButton: UIButton!
    @IBOutlet var labelNameLabel: UILabel!
    
    var releaseTitle: String = ""
    var link: String = ""
    var tracklist: [String] = []
    var artwork = UIImage.init(systemName: "stop")!
    var labelName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        artworkImageView.image = artwork
        labelNameLabel.text = "Label: " + labelName
        topNavigationItem.title = releaseTitle
        
        if tracklist.count == 1 {
            tracksLabel.text = tracklist[0] + " (Single)"
        } else {
            tracksLabel.text = tracklist.joined(separator: ", ")
        }
        
        linkButton.setTitle(link, for: .normal)
    }

    @IBAction func openLink() {
            guard let url = URL(string: link) else { return }
            UIApplication.shared.open(url)
    }
}
