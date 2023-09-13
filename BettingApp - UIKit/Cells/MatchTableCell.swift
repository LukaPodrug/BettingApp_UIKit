//
//  MatchTableCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class MatchTableCell: UITableViewCell {
    static let identifier: String = "MatchTableCell"
    
    let team1LogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray4
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let team1NameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 3
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = .systemGray5
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = .systemGray5
        return label
    }()
    
    let team2NameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 3
        return label
    }()
    
    let team2LogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray4
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(team1LogoImageView)
        contentView.addSubview(team1NameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(team2NameLabel)
        contentView.addSubview(team2LogoImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        team1LogoImageView.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        
        team1NameLabel.frame = CGRect(x: 60, y: 10, width: self.frame.width / 2 - 120, height: 40)
        
        dateLabel.frame = CGRect(x: self.frame.width / 2 - 50, y: 10, width: 100, height: 20)
        
        timeLabel.frame = CGRect(x: self.frame.width / 2 - 50, y: 35, width: 100, height: 15)
        
        team2NameLabel.frame = CGRect(x: self.frame.width / 2 + 60, y: 10, width: self.frame.width / 2 - 120, height: 40)
        
        team2LogoImageView.frame = CGRect(x: self.frame.width - 50, y: 10, width: 40, height: 40)
    }
    
    
    func configureTeam1LogoImageView(image: String) {
        team1LogoImageView.loadImageFromURL(url: URL(string: image)!, placeholder: "shield.checkerboard")
    }
    
    func configureTeam1NameLabel(text: String) {
        team1NameLabel.text = text
    }
    
    func configureDateLabel(text: String) {
        dateLabel.text = text
    }
    
    func configureTimeLabel(text: String) {
        timeLabel.text = text
    }
    
    func configureTeam2NameLabel(text: String) {
        team2NameLabel.text = text
    }
    
    func configureTeam2LogoImageView(image: String) {
        team2LogoImageView.loadImageFromURL(url: URL(string: image)!, placeholder: "shield.checkerboard")
    }
}
