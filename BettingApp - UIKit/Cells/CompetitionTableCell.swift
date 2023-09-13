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
        
        imageViewCustomization()
        textLabelCustomization()
        detailTextCustomization()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageViewCustomization() {
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.imageView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
    func textLabelCustomization() {
        self.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.textLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
    }
    
    func detailTextCustomization() {
        self.detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.detailTextLabel?.topAnchor.constraint(equalTo: self.textLabel!.bottomAnchor, constant: 5).isActive = true
        self.detailTextLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
    }
    
    func configureImage(image: String) {
        self.imageView!.loadImageFromURL(url: URL(string: image)!, placeholder: "trophy")
    }
    
    func configureMainLabel(text: String) {
        self.textLabel!.text = text
    }
    
    func configureDetailsLabel(text: String) {
        self.detailTextLabel!.text = text
    }
}
