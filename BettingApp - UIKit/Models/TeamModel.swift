//
//  TeamModel.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 12.09.2023..
//

import Foundation

struct Team {
    let id: String
    let sportId: String
    let name: String
    let logo: String
}

let teamsMock: [Team] = [
    Team(id: "1", sportId: "1", name: "barcelona", logo: "https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png"),
    Team(id: "2", sportId: "1", name: "hajduk", logo: "https://upload.wikimedia.org/wikipedia/hr/thumb/a/ad/HNK_Hajduk_Split.svg/1200px-HNK_Hajduk_Split.svg.png"),
    Team(id: "3", sportId: "1", name: "dinamo", logo: "https://logodownload.org/wp-content/uploads/2020/03/dinamo-zagreb-logo.png"),
    Team(id: "4", sportId: "1", name: "real madrid", logo: "https://assets.stickpng.com/images/584a9b47b080d7616d298778.png"),
    Team(id: "5", sportId: "1", name: "juventus", logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Juventus_Logo.png/1200px-Juventus_Logo.png"),
    Team(id: "6", sportId: "1", name: "liverpool", logo: "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4e5.png"),
]
