//
//  CompetitionModel.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import Foundation

struct Competition {
    let id: String
    let sportId: String
    let name: String
    let area: String
    let logo: String
}

let competitionsMock: [Competition] = [
    Competition(id: "1", sportId: "1", name: "premier lague", area: "england", logo: "https://www.pngmart.com/files/23/Premier-League-Logo-PNG.png"),
    Competition(id: "2", sportId: "1", name: "ligue 1", area: "france", logo: "https://logodownload.org/wp-content/uploads/2019/09/ligue-1-logo-0.png"),
    Competition(id: "3", sportId: "1", name: "champions league", area: "europe", logo: "https://logodownload.org/wp-content/uploads/2017/05/uefa-champions-league-logo-0.png"),
    Competition(id: "4", sportId: "1", name: "serie a", area: "italy", logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Serie_A.png/2048px-Serie_A.png"),
    Competition(id: "5", sportId: "1", name: "la liga", area: "spain", logo: "https://crystalpng.com/wp-content/uploads/2023/06/La-liga-new-logo.png"),
    Competition(id: "6", sportId: "1", name: "europa league", area: "europe", logo: "https://logos-download.com/wp-content/uploads/2017/11/UEFA_Europa_League_logo.png")
]
