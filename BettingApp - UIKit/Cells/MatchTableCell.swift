//
//  MatchTableCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class MatchTableCell: UITableViewCell {
    static let identifier: String = "MatchTableCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let team1LogoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let teamNamesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let team2LogoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(team1LogoImageView)
        contentView.addSubview(teamNamesLabel)
        contentView.addSubview(team2LogoImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        dateLabel.frame = CGRect(x: 5, y: 5, width: 100, height: 20)
        
        timeLabel.frame = CGRect(x: 5, y: 35, width: 100, height: 20)
        
        team1LogoImageView.frame = CGRect(x: 110, y: 15, width: 30, height: 30)
        
        teamNamesLabel.frame = CGRect(x: 165, y: 5, width: Int(self.frame.width) - 190, height: 50)
        
        team2LogoImageView.frame = CGRect(x: Int(self.frame.width) - 40, y: 15, width: 30, height: 30)
    }
    
    func configureDateLabel(text: String) {
        dateLabel.text = text
    }
    
    func configureTimeLabel(text: String) {
        timeLabel.text = text
    }
    
    func configureTeam1LogoImageView(image: String) {
        team1LogoImageView.loadImageFromURL(url: URL(string: image)!, placeholder: "shield.checkered")
    }
    
    func configureTeamNamesLabel(text: String) {
        teamNamesLabel.text = text
    }
    
    func configureTeam2LogoImageView(image: String) {
        team2LogoImageView.loadImageFromURL(url: URL(string: image)!, placeholder: "shield.checkered")
    }
}
