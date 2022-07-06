//
//  User.swift
//  LoginApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import Foundation

struct User {
    let login: String
    var password: String
    
    var personalInfo: PersonalInfo
    
    var releases: [Releases]
}

struct PersonalInfo {
    var name: String
    var aboutMe: String
}

struct Releases {
    var albumName: String
    var link: URL
    var albumType: AlbumType
    var tracks: [String]
}

enum AlbumType {
    case Single
    case EP
}
