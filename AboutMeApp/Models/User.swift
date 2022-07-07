//
//  User.swift
//  LoginApp
//
//  Created by Ilya Kozhevnikov on 06.07.2022.
//

import Foundation

struct Login {
    var login: String
    var password: String
    
    static func getDefaultLogin() -> Login {
        Login(login: "ilyakozhevn", password: "lalala")
    }
}

struct User {
    let login: String
    
    var info: Info
    
    var releases: [Release]
    
    static func createUser(login: String) -> User {
        User(
            login: login,
            info: Info.getInfo(),
            releases: Release.getReleases()
        )
    }
}

struct Info {
    var name: String
    var about: String
    var references: [String]
    var avatar: String
    
    static func getInfo() -> Info {
        Info(
            name: "Ilya Kozhevnikov",
            about: "electronic artist from Russia who makes melodic deep techno. His music is for the chill out moments when you’re looking to kick back at the end of party.",
            references: ["Yagya", "Stephan Bodzin"],
            avatar: "Ilya Kozhevnikov_main3000"
        )
    }
}

struct Release {
    var albumName: String
    var link: String
    var labelName: Labels
    var tracks: [String]
    var image: String
    
    static func getReleases() -> [Release] {
        [
            Release(
                albumName: "Hello World",
                link: "https://soundcloud.com/elliahh/hello-world",
                labelName: .Elliahh,
                tracks: ["Hello World"],
                image: "helloWorld"
            ),
            Release(
                albumName: "Memories",
                link: "https://ilya.bandcamp.com/track/memories-extended-mix",
                labelName: .Elliahh,
                tracks: ["Memories"],
                image: "memories"
            ),
            Release(
                albumName: "Primitive",
                link: "https://www.beatport.com/release/primitive/3626152",
                labelName: .Suprematic,
                tracks: ["Primitive"],
                image: "primitive"
            ),
            Release(
                albumName: "The End Of Time",
                link: "https://insectorama.bandcamp.com/album/the-end-of-time",
                labelName: .Insectorama,
                tracks: ["Hello World", "Clouds", "The End Of Time", "Miracle"],
                image: "theEndOfTime"
            ),
            Release(
                albumName: "Rest State",
                link: "https://www.beatport.com/release/rest-state/3659521",
                labelName: .Suprematic,
                tracks: ["Rest State (Extended Mix)"],
                image: "restState"
            ),
            Release(
                albumName: "Try",
                link: "https://www.beatport.com/release/try/3722356",
                labelName: .Suprematic,
                tracks: ["Try (Extended Mix)"],
                image: "try"
            )
        ]
    }
}

enum Labels: String {
    case Elliahh
    case Suprematic
    case Insectorama
}
