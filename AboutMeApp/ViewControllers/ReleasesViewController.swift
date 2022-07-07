//
//  ReleasesViewController.swift
//  AboutMeApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import UIKit

class ReleasesViewController: UIViewController {

    @IBOutlet var albumButtons: [UIButton]!
    
    var releases = [Release(albumName: "", link: "", labelName: .Elliahh, tracks: [""], image: UIImage.init(systemName: "stop")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitlesForButtons()
        hideExtraButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let releaseVC = segue.destination as? ReleaseViewController else { return }
        guard let button = sender as? UIButton else { return }

        let index = Int(button.accessibilityLabel ?? "0") ?? 0
        let release = releases[index]
        
        releaseVC.labelName = release.labelName.rawValue
        releaseVC.link = release.link
        releaseVC.title = release.albumName
        releaseVC.tracklist = release.tracks
        releaseVC.artwork = release.image
    }
    
    @IBAction func releaseButtonTouched(_ sender: UIButton) {
        performSegue(withIdentifier: "showRelease", sender: sender)
    }
    
    private func setTitlesForButtons() {
        for (index, release) in releases.enumerated() {
            if index < albumButtons.count {
                albumButtons[index].setTitle(release.albumName, for: .normal)
            }
        }
    }
    
    private func hideExtraButtons() {
        if albumButtons.count > releases.count {
            for albumIndex in releases.count..<albumButtons.count {
                albumButtons[albumIndex].isHidden = true
            }
        }
    }
}
