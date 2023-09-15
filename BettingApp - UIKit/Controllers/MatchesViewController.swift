//
//  MatchesViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 13.09.2023..
//

import UIKit

class MatchesViewController: UIViewController {
    var sport: Sport
    var competition: Competition
    var matches: [Match]
    
    init(sport: Sport, competition: Competition) {
        self.sport = sport
        self.competition = competition
        self.matches = matchesMock.filter({ match in
            if match.sportId == sport.id && match.competitionId == competition.id {
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
        navigationItem.title = competition.name.capitalized
    }
    
    func createElements() {
        view.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        createMatchesTableView()
    }
    
    func createMatchesTableView() {
        let matchesTableViewFrame: CGRect = CGRect(x: 0, y: 100, width: Int(view.frame.width), height: Int(view.frame.height) - 100)

        let matchesTableView: UITableView = UITableView(frame: matchesTableViewFrame)
        matchesTableView.register(MatchTableCell.self, forCellReuseIdentifier: MatchTableCell.identifier)
        matchesTableView.dataSource = self
        matchesTableView.delegate = self
        matchesTableView.separatorInset = UIEdgeInsets.zero
        matchesTableView.alwaysBounceVertical = false
        
        self.view.addSubview(matchesTableView)
    }
}

extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MatchTableCell = tableView.dequeueReusableCell(withIdentifier: MatchTableCell.identifier) as! MatchTableCell
        
        let match: Match = matches[indexPath.row]
        
        let team1: Team = teamsMock.first(where: { $0.id == match.team1Id })!
        let team2: Team = teamsMock.first(where: { $0.id == match.team2Id })!
        
        cell.configureTeam1LogoImageView(image: team1.logo)
        cell.configureTeam1NameLabel(text: team1.name.capitalized)
        cell.configureDateLabel(text: match.date)
        cell.configureTimeLabel(text: match.time)
        cell.configureTeam2NameLabel(text: team2.name.capitalized)
        cell.configureTeam2LogoImageView(image: team2.logo)
        
        return cell
    }
}

extension MatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let match: Match = matches[indexPath.row]
        
        let oddsViewController: OddsViewController = OddsViewController(sport: sport, competition: competition, match: match)
        
        navigationController?.pushViewController(oddsViewController, animated: true)
    }
}
