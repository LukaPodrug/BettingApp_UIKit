//
//  TicketBarViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class TicketBarViewController: UIViewController {
    var numberOfPairsValue: Int = UserDefaults().integer(forKey: "numberOfPairs")
    var stakeValue: Decimal = Decimal(UserDefaults().double(forKey: "stake"))
    var oddsValue: Decimal = Decimal(UserDefaults().double(forKey: "odds"))
    var returnValue: Decimal = Decimal(UserDefaults().double(forKey: "return"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        createTicketBar()
    }
    
    func createTicketBar() {
        let numberOfPairsLabelFrame: CGRect = CGRect(x: 20, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let numberOfPairsLabel: UILabel = UILabel(frame: numberOfPairsLabelFrame)
        if numberOfPairsValue == 1 {
            numberOfPairsLabel.text = "1 pair"
        }
        else {
            numberOfPairsLabel.text = "\(numberOfPairsValue) pairs"
        }
        
        view.addSubview(numberOfPairsLabel)
        
        let stakeLabelFrame: CGRect = CGRect(x: 20, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let stakeLabel: UILabel = UILabel(frame: stakeLabelFrame)
        stakeLabel.text = "stake: \(stakeValue)€".capitalized
        
        view.addSubview(stakeLabel)
        
        let oddsLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let oddsLabel: UILabel = UILabel(frame: oddsLabelFrame)
        oddsLabel.text = "odds: \(oddsValue)".capitalized
        
        view.addSubview(oddsLabel)
        
        let returnLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let returnLabel: UILabel = UILabel(frame: returnLabelFrame)
        returnLabel.text = "return: \(returnValue)€".capitalized
        
        view.addSubview(returnLabel)
        
        let expandButtonFrame: CGRect = CGRect(x: 2 * (Int(view.frame.width) - 80) / 2 + 30, y: 5, width: Int(view.frame.width) - 2 * (Int(view.frame.width) - 80) / 2 - 40, height: 45)
        
        let expandButton: UIButton = UIButton(frame: expandButtonFrame)
        expandButton.setImage(UIImage(systemName: "chevron.up.circle"), for: .normal)
        expandButton.addTarget(self, action: #selector(openTicketModal), for: .primaryActionTriggered)
        
        view.addSubview(expandButton)
    }
    
    @objc func openTicketModal() {
        let ticketViewController: TicketViewController = TicketViewController()
        self.present(ticketViewController, animated: true)
    }
}
