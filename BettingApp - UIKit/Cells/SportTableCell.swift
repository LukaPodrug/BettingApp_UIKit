//
//  SportTableCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class SportTableCell: UITableViewCell {
    static let identifier: String = "SportTableCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(image: String) {
        self.imageView!.image = UIImage(systemName: image)
    }
    
    func configureLabel(text: String) {
        self.textLabel!.text = text
    }
}
