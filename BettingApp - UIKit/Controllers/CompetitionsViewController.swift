//
//  CompetitionsViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class CompetitionsViewController: UIViewController {
    var sport: Sport
    var competitions: [Competition]
    
    init(sport: Sport) {
        self.sport = sport
        self.competitions = footballCompetitionsMock
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCustomization()
        navigationItemCustomization()
        createElements()
    }
    
    func viewCustomization() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
    }
    
    func navigationItemCustomization() {
        navigationItem.title = sport.name.capitalized
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "search".capitalized, style: .plain, target: self, action: #selector(searchButtonHandler))
    }
    
    func createElements() {
        view.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        createCompetitionsTableView()
        createTicketBar()
    }
    
    func createCompetitionsTableView() {
        let competitionsTableViewFrame: CGRect = CGRect(x: 0, y: 100, width: Int(view.frame.width), height: Int(view.frame.height) - 180)

        let competitionsTableView: UITableView = UITableView(frame: competitionsTableViewFrame)
        competitionsTableView.register(CompetitionTableCell.self, forCellReuseIdentifier: CompetitionTableCell.identifier)
        competitionsTableView.dataSource = self
        competitionsTableView.delegate = self
        competitionsTableView.alwaysBounceVertical = false
        
        self.view.addSubview(competitionsTableView)
    }
    
    func createTicketBar() {
        let ticketBarViewFrame: CGRect = CGRect(x: 0, y: Int(view.frame.height) - 80, width: Int(view.frame.width), height: 80)
        
        let ticketBarView: UIView = UIView(frame: ticketBarViewFrame)
        ticketBarView.backgroundColor = .systemGray5
        
        let numberOfPairsLabelFrame: CGRect = CGRect(x: 20, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let numberOfPairsLabel: UILabel = UILabel(frame: numberOfPairsLabelFrame)
        numberOfPairsLabel.text = "2 pairs"
        
        ticketBarView.addSubview(numberOfPairsLabel)
        
        let stakeLabelFrame: CGRect = CGRect(x: 20, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let stakeLabel: UILabel = UILabel(frame: stakeLabelFrame)
        stakeLabel.text = "stake: 10.00€"
        
        ticketBarView.addSubview(stakeLabel)
        
        let oddsLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 5, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let oddsLabel: UILabel = UILabel(frame: oddsLabelFrame)
        oddsLabel.text = "odds: 4.3450"
        
        ticketBarView.addSubview(oddsLabel)
        
        let returnLabelFrame: CGRect = CGRect(x: 20 + (Int(view.frame.width) - 80) / 2 + 10, y: 30, width: (Int(view.frame.width) - 80) / 2, height: 20)
        
        let returnLabel: UILabel = UILabel(frame: returnLabelFrame)
        returnLabel.text = "return: 43.45€"
        
        ticketBarView.addSubview(returnLabel)
        
        let expandButtonFrame: CGRect = CGRect(x: 2 * (Int(view.frame.width) - 80) / 2 + 30, y: 5, width: Int(view.frame.width) - 2 * (Int(view.frame.width) - 80) / 2 - 40, height: 45)
        
        let expandButton: UIButton = UIButton(frame: expandButtonFrame)
        expandButton.setImage(UIImage(systemName: "chevron.up.circle"), for: .normal)
        
        ticketBarView.addSubview(expandButton)
        
        view.addSubview(ticketBarView)
    }
    
    @objc func searchButtonHandler() {
        
    }
}

extension CompetitionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CompetitionTableCell = tableView.dequeueReusableCell(withIdentifier: CompetitionTableCell.identifier) as! CompetitionTableCell
        
        let competition: Competition = competitions[indexPath.row]
        
        cell.configureMainLabel(text: competition.name.capitalized)
        cell.configureDetailsLabel(text: competition.area.capitalized)
        
        return cell
    }
}

extension CompetitionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
