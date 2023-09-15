//
//  OddsViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class OddsViewController: UIViewController {
    var sport: Sport
    var competition: Competition
    var match: Match
    var odds: [Odd]
    
    init(sport: Sport, competition: Competition, match: Match) {
        self.sport = sport
        self.competition = competition
        self.match = match
        self.odds = oddsMock.filter({ odd in
            if odd.sportId == sport.id && odd.competitionId == competition.id && odd.matchId == match.id {
                return true
            }
            else {
                return false
            }
        })
        
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
        view.backgroundColor = .systemGray5
    }
    
    func navigationItemCustomization() {
        let team1: Team = teamsMock.first(where: { $0.id == match.team1Id })!
        let team2: Team = teamsMock.first(where: { $0.id == match.team2Id })!
        
        navigationItem.title = "\(team1.name.capitalized) - \(team2.name.capitalized)"
    }
    
    func createElements() {
        view.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        createOddsTableView()
    }
    
    func createOddsTableView() {
        let oddsTableViewFrame: CGRect = CGRect(x: 0, y: 100, width: Int(view.frame.width), height: Int(view.frame.height) - 100)

        let oddsTableView: UITableView = UITableView(frame: oddsTableViewFrame)
        oddsTableView.register(OddTableCell.self, forCellReuseIdentifier: OddTableCell.identifier)
        oddsTableView.dataSource = self
        oddsTableView.delegate = self
        oddsTableView.separatorInset = UIEdgeInsets.zero
        oddsTableView.alwaysBounceVertical = false
        
        self.view.addSubview(oddsTableView)
    }
}

extension OddsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return odds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OddTableCell = tableView.dequeueReusableCell(withIdentifier: OddTableCell.identifier) as! OddTableCell
        
        let odd: Odd = odds[indexPath.row]
        
        cell.configureId(text: odd.id)
        cell.configureOddNameLabel(text: odd.name.uppercased())
        cell.configureOutcome1NameButton(text: odd.label1.uppercased())
        cell.configureOutcome1ValueButton(text: NSDecimalNumber(decimal: odd.value1).stringValue)
        cell.configureOutcomeX(nameText: odd.labelX?.uppercased(), valueText: NSDecimalNumber(decimal: odd.valueX ?? 1.00).stringValue)
        cell.configureOutcome2NameButton(text: odd.label2.uppercased())
        cell.configureOutcome2ValueButton(text: NSDecimalNumber(decimal: odd.value2).stringValue)
        
        return cell
    }
}

extension OddsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
