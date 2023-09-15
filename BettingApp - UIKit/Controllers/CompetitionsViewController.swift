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
        self.competitions = competitionsMock.filter({ competition in
            if competition.sportId == sport.id {
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
        navigationItem.title = sport.name.capitalized
    }
    
    func createElements() {
        view.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        createCompetitionsTableView()
    }
    
    func createCompetitionsTableView() {
        let competitionsTableViewFrame: CGRect = CGRect(x: 0, y: 100, width: Int(view.frame.width), height: Int(view.frame.height) - 100)

        let competitionsTableView: UITableView = UITableView(frame: competitionsTableViewFrame)
        competitionsTableView.register(CompetitionTableCell.self, forCellReuseIdentifier: CompetitionTableCell.identifier)
        competitionsTableView.dataSource = self
        competitionsTableView.delegate = self
        competitionsTableView.separatorInset = UIEdgeInsets.zero
        competitionsTableView.alwaysBounceVertical = false
        
        self.view.addSubview(competitionsTableView)
    }
}

extension CompetitionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CompetitionTableCell = tableView.dequeueReusableCell(withIdentifier: CompetitionTableCell.identifier) as! CompetitionTableCell
        
        let competition: Competition = competitions[indexPath.row]
        
        cell.configureImage(image: competition.logo)
        cell.configureMainLabel(text: competition.name.capitalized)
        cell.configureDetailsLabel(text: competition.area.capitalized)
        
        return cell
    }
}

extension CompetitionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let competition: Competition = competitions[indexPath.row]
        
        let matchesViewController: MatchesViewController = MatchesViewController(sport: sport, competition: competition)
        
        navigationController?.pushViewController(matchesViewController, animated: true)
    }
}
