//
//  CompetitionTableCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class CompetitionTableCell: UITableViewCell {
    static let identifier: String = "CompetitionTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMainLabel(text: String) {
        self.textLabel!.text = text
    }
    
    func configureDetailsLabel(text: String) {
        self.detailTextLabel!.text = text
    }
}
