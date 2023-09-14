//
//  OddTableCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class OddTableCell: UITableViewCell {
    static let identifier: String = "OddTableCell"
    
    var twoOptions: Bool = false
    
    let oddNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 3
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        return label
    }()
    
    let outcome1NameButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.tag = 1
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    let outcome1ValueButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray2
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.tag = 1
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    let outcomeXNameButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray3
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.tag = 0
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    let outcomeXValueButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray2
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.tag = 0
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    let outcome2NameButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray3
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.tag = 2
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    let outcome2ValueButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray2
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.tag = 2
        button.addTarget(self, action: #selector(oddClick(_ :)), for: .primaryActionTriggered)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(oddNameLabel)
        contentView.addSubview(outcome1NameButton)
        contentView.addSubview(outcome1ValueButton)
        contentView.addSubview(outcomeXNameButton)
        contentView.addSubview(outcomeXValueButton)
        contentView.addSubview(outcome2NameButton)
        contentView.addSubview(outcome2ValueButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        oddNameLabel.frame = CGRect(x: self.frame.width / 2 - 100, y: 5, width: 200, height: 25)
        
        if twoOptions == false {
            outcome1NameButton.frame = CGRect(x: 5, y: 35, width: (Int(self.frame.width) - 20) / 3, height: 20)
            
            outcome1ValueButton.frame = CGRect(x: 5, y: 55, width: (Int(self.frame.width) - 20) / 3, height: 20)
            
            outcomeXNameButton.frame = CGRect(x: 10 + (Int(self.frame.width) - 20) / 3, y: 35, width: (Int(self.frame.width) - 20) / 3, height: 20)
            
            outcomeXValueButton.frame = CGRect(x: 10 + (Int(self.frame.width) - 20) / 3, y: 55, width: (Int(self.frame.width) - 20) / 3, height: 20)
            
            outcome2NameButton.frame = CGRect(x: 15 + 2 * (Int(self.frame.width) - 20) / 3, y: 35, width: (Int(self.frame.width) - 20) / 3, height: 20)
            
            outcome2ValueButton.frame = CGRect(x: 15 + 2 * (Int(self.frame.width) - 20) / 3, y: 55, width: (Int(self.frame.width) - 20) / 3, height: 20)
        }
        else {
            outcome1NameButton.frame = CGRect(x: 5, y: 35, width: (Int(self.frame.width) - 15) / 2, height: 20)
            
            outcome1ValueButton.frame = CGRect(x: 5, y: 55, width: (Int(self.frame.width) - 15) / 2, height: 20)
            
            outcomeXNameButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
            outcomeXValueButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
            outcome2NameButton.frame = CGRect(x: 10 + (Int(self.frame.width) - 15) / 2, y: 35, width: (Int(self.frame.width) - 15) / 2, height: 20)
            
            outcome2ValueButton.frame = CGRect(x: 10 + (Int(self.frame.width) - 15) / 2, y: 55, width: (Int(self.frame.width) - 15) / 2, height: 20)
        }
    }
    
    func configureOddNameLabel(text: String) {
        oddNameLabel.text = text
    }
    
    func configureOutcome1NameButton(text: String) {
        outcome1NameButton.setTitle(text, for: .normal)
    }
    
    func configureOutcome1ValueButton(text: String) {
        outcome1ValueButton.setTitle(text, for: .normal)
    }
    
    func configureOutcomeX(nameText: String?, valueText: String?) {
        if nameText != nil {
            outcomeXNameButton.setTitle(nameText, for: .normal)
            outcomeXValueButton.setTitle(valueText, for: .normal)
        }
        else {
            twoOptions = true
            self.layoutSubviews()
        }
    }
    
    func configureOutcome2NameButton(text: String) {
        outcome2NameButton.setTitle(text, for: .normal)
    }
    
    func configureOutcome2ValueButton(text: String) {
        outcome2ValueButton.setTitle(text, for: .normal)
    }
    
    @objc func oddClick(_ sender: UIButton) {
        if sender.tag == 1 {
            outcome1NameButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            outcome1ValueButton.backgroundColor = .systemBlue
        }
        else if sender.tag == 2 {
            outcome2NameButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            outcome2ValueButton.backgroundColor = .systemBlue
        }
        else {
            outcomeXNameButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            outcomeXValueButton.backgroundColor = .systemBlue
        }
    }
}
