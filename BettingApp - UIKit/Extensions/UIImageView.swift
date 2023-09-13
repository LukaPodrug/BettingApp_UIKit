//
//  UIImageView.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFromURL(url: URL, placeholder: String) {
        self.image = UIImage(systemName: placeholder)
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
