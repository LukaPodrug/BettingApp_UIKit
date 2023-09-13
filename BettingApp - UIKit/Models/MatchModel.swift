//
//  MatchModel.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 12.09.2023..
//

import Foundation

struct Match {
    let id: String
    let competitionId: String
    let sportId: String
    let team1Id: String
    let team2Id: String
    let date: String
    let time: String
}

let matchesMock: [Match] = [
    Match(id: "1", competitionId: "1", sportId: "1", team1Id: "1", team2Id: "2", date: "20/10/2023", time: "18:00"),
    Match(id: "2", competitionId: "2", sportId: "1", team1Id: "3", team2Id: "5", date: "09/10/2023", time: "12:00"),
    Match(id: "3", competitionId: "2", sportId: "1", team1Id: "5", team2Id: "4", date: "21/10/2023", time: "18:00"),
    Match(id: "4", competitionId: "3", sportId: "1", team1Id: "2", team2Id: "6", date: "20/10/2023", time: "17:00"),
    Match(id: "5", competitionId: "1", sportId: "1", team1Id: "5", team2Id: "3", date: "19/09/2023", time: "10:00"),
    Match(id: "6", competitionId: "4", sportId: "1", team1Id: "1", team2Id: "4", date: "20/12/2023", time: "15:30")
]
