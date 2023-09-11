//
//  SportCollectionCell.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class SportCollectionCell: UICollectionViewCell {
    static let identifier: String = "SportCollectionCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = .systemGray5
        
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width - 20, height: contentView.frame.width - 20)
        label.frame = CGRect(x: 0, y: contentView.frame.height - 40, width: contentView.frame.width, height: 40)
    }
    
    func configureImage(image: String) {
        imageView.image = UIImage(systemName: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -55).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    func configureLabel(text: String) {
        label.text = text
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        label.text = nil
    }
}
