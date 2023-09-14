//
//  OddModel.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 12.09.2023..
//

import Foundation

struct Odd {
    let id: String
    let matchId: String
    let competitionId: String
    let sportId: String
    let name: String
    let value1: Decimal
    let valueX: Decimal?
    let value2: Decimal
    let label1: String
    let labelX: String?
    let label2: String
}

let oddsMock: [Odd] = [
    Odd(id: "1", matchId: "5", competitionId: "1", sportId: "1", name: "final score", value1: 2.10, valueX: 3.00, value2: 1.80, label1: "1", labelX: "x", label2: "2"),
    Odd(id: "2", matchId: "4", competitionId: "3", sportId: "1", name: "final score", value1: 1.30, valueX: 3.20, value2: 5.20, label1: "1", labelX: "x", label2: "2"),
    Odd(id: "3", matchId: "2", competitionId: "2", sportId: "1", name: "final score", value1: 2.80, valueX: 3.10, value2: 1.50, label1: "1", labelX: "x", label2: "2"),
    Odd(id: "4", matchId: "6", competitionId: "4", sportId: "1", name: "final score", value1: 1.85, valueX: 2.50, value2: 1.85, label1: "1", labelX: "x", label2: "2"),
    Odd(id: "5", matchId: "1", competitionId: "1", sportId: "1", name: "final score", value1: 4.20, valueX: 2.90, value2: 1.30, label1: "1", labelX: "x", label2: "2"),
    Odd(id: "6", matchId: "6", competitionId: "4", sportId: "1", name: "goals sum - 2.5", value1: 1.85, valueX: nil, value2: 1.85, label1: "less", labelX: nil, label2: "more"),
    Odd(id: "7", matchId: "6", competitionId: "4", sportId: "1", name: "goal in both half times", value1: 1.50, valueX: nil, value2: 2.40, label1: "yes", labelX: nil, label2: "no"),
    Odd(id: "8", matchId: "4", competitionId: "3", sportId: "1", name: "goals sum - 1.5", value1: 1.70, valueX: nil, value2: 2.00, label1: "less", labelX: nil, label2: "more"),
    Odd(id: "9", matchId: "1", competitionId: "1", sportId: "1", name: "both teams score goal", value1: 1.85, valueX: nil, value2: 1.85, label1: "yes", labelX: nil, label2: "no")
]
