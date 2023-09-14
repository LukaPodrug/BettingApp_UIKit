//
//  BaseViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 14.09.2023..
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sportsViewController: SportsViewController = SportsViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: sportsViewController)
        navigationController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 80)
        
        addChild(navigationController)
        view.addSubview(navigationController.view)
        
        let ticketViewController: TicketViewController = TicketViewController()
        ticketViewController.view.frame = CGRect(x: 0, y: view.frame.height - 80, width: view.frame.width, height: 80)
        
        addChild(ticketViewController)
        view.addSubview(ticketViewController.view)
    }
}
