//
//  TicketBarViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class TicketBarViewController: UIViewController {
    var numberOfPairsValue: String = UserDefaults().string(forKey: "numberOfPairs") ?? "0"
    var stakeValue: String = UserDefaults().string(forKey: "stake") ?? "1.00"
    var oddsValue: String = UserDefaults().string(forKey: "odds") ?? "1.00"
    var returnValue: String = UserDefaults().string(forKey: "return") ?? "1.00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        createTicketBar()
    }
    
    func createTicketBar() {
        let numberOfPairsLabelFrame: CGRect = CGRect(x: 20, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let numberOfPairsLabel: UILabel = UILabel(frame: numberOfPairsLabelFrame)
        numberOfPairsLabel.text = "2 pairs"
        
        view.addSubview(numberOfPairsLabel)
        
        let stakeLabelFrame: CGRect = CGRect(x: 20, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let stakeLabel: UILabel = UILabel(frame: stakeLabelFrame)
        stakeLabel.text = "stake: 10.00€"
        
        view.addSubview(stakeLabel)
        
        let oddsLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let oddsLabel: UILabel = UILabel(frame: oddsLabelFrame)
        oddsLabel.text = "odds: 4.3450"
        
        view.addSubview(oddsLabel)
        
        let returnLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let returnLabel: UILabel = UILabel(frame: returnLabelFrame)
        returnLabel.text = "return: 43.45€"
        
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
