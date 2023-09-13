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
    Team(id: "1", sportId: "1", name: "liverpool", logo: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4e5.png"),
    Team(id: "2", sportId: "1", name: "newcastle", logo: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4ec.png"),
    Team(id: "3", sportId: "1", name: "chelsea", logo: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4e1.png"),
    Team(id: "4", sportId: "1", name: "arsenal", logo: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4df.png"),
    Team(id: "5", sportId: "1", name: "tottenham", logo: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4ee.png"),
    Team(id: "6", sportId: "1", name: "barcelona", logo: "https://assets.stickpng.com/thumbs/584a9b3bb080d7616d298777.png"),
]
