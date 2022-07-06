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
    
    var info: Info
    
    var releases: [Release]
    
    static func getUser() -> User {
        User(
            login: "ilyakozhevn",
            password: "lalala",
            info:
                Info(
                    name: "Ilya Kozhevnikov",
                    about: "electronic artist from Russia who makes melodic deep techno. His music is for the chill out moments when you’re looking to kick back at the end of party.",
                    references: ["Yagya", "Stephan Bodzin"]
                ),
            
            releases: [
                Release(
                    albumName: "Hello World",
                    link: "https://soundcloud.com/elliahh/hello-world",
                    albumType: .Single,
                    tracks: ["Hello World"]),
                Release(
                    albumName: "Memories",
                    link: "https://ilya.bandcamp.com/track/memories-extended-mix",
                    albumType: .Single,
                    tracks: ["Memories"]),
                Release(
                    albumName: "Primitive",
                    link: "https://www.beatport.com/release/primitive/3626152",
                    albumType: .Single,
                    tracks: ["Primitive"]),
                Release(
                    albumName: "The End Of Time",
                    link: "https://insectorama.bandcamp.com/album/the-end-of-time",
                    albumType: .EP,
                    tracks: ["Hello World", "Clouds", "The End Of Time", "Miracle"]),
                Release(
                    albumName: "Rest State",
                    link: "https://www.beatport.com/release/rest-state/3659521",
                    albumType: .Single,
                    tracks: ["Rest State (Extended Mix)"]),
                Release(
                    albumName: "Try",
                    link: "https://www.beatport.com/release/try/3722356",
                    albumType: .Single,
                    tracks: ["Try (Extended Mix)"])
            ]
        )
    }
}

struct Info {
    var name: String
    var about: String
    var references: [String]
}

struct Release {
    var albumName: String
    var link: String
    var albumType: AlbumType
    var tracks: [String]
}

enum AlbumType {
    case Single
    case EP
}


//    guard let url = URL(string: "https://stackoverflow.com") else { return }
//    UIApplication.shared.open(url)
