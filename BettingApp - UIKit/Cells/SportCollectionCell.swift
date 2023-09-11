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
        
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 50)
        label.frame = CGRect(x: 0, y: contentView.frame.height - 50, width: contentView.frame.width, height:50)
    }
    
    func configureImage(image: String) {
        imageView.image = UIImage(systemName: image)
    }
    
    func configureLabel(text: String) {
        label.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        label.text = nil
    }
}
