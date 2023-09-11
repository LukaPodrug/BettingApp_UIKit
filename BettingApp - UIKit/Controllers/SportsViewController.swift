//
//  SportsViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class SportsViewController: UIViewController {
    var layout: String = "collection"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCustomization()
        navigationItemCustomization()
        createElements()
    }
    
    func viewCustomization() {
        view.backgroundColor = .white
    }
    
    func navigationItemCustomization() {
        navigationItem.title = "sports".capitalized
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "search".capitalized, style: .plain, target: self, action: #selector(searchButtonHandler))
    }
    
    func createElements() {
        view.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        createMenuBar()
        
        if layout == "collection" {
            createSportsCollectionView()
        }
        else {
            createSportsTableView()
        }
    }
    
    func createMenuBar() {
        let menuBarViewFrame: CGRect = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        
        let menuBarView: UIView = UIView(frame: menuBarViewFrame)
        menuBarView.backgroundColor = .systemGray5
        
        let collectionViewButtonFrame: CGRect = CGRect(x: menuBarViewFrame.width - 100, y: 0, width: menuBarViewFrame.height, height: menuBarViewFrame.height)
        
        let collectionViewButton: UIButton = UIButton(frame: collectionViewButtonFrame)
        collectionViewButton.setImage(UIImage(systemName: "square.grid.3x3"), for: .normal)
        if layout == "collection" {
            collectionViewButton.backgroundColor = .systemGray3
        }
        collectionViewButton.addTarget(self, action: #selector(showCollectionLayout(sender:)), for: .primaryActionTriggered)
        
        menuBarView.addSubview(collectionViewButton)
        
        let tableViewButtonFrame: CGRect = CGRect(x: menuBarViewFrame.width - 50, y: 0, width: menuBarViewFrame.height, height: menuBarViewFrame.height)
        
        let tableViewButton: UIButton = UIButton(frame: tableViewButtonFrame)
        tableViewButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        if layout == "table" {
            tableViewButton.backgroundColor = .systemGray3
        }
        tableViewButton.addTarget(self, action: #selector(showTableLayout(sender:)), for: .primaryActionTriggered)
        
        menuBarView.addSubview(tableViewButton)
        
        self.view.addSubview(menuBarView)
    }
    
    func createSportsCollectionView() {
        let sportsCollectionViewFrame: CGRect = CGRect(x: 0, y: 150, width: Int(view.frame.width), height: Int(view.frame.height) - 250)
        
        let sportsCollectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let sportsCollectionView: UICollectionView = UICollectionView(frame: sportsCollectionViewFrame, collectionViewLayout: sportsCollectionViewFlowLayout)
        sportsCollectionView.register(SportCollectionCell.self, forCellWithReuseIdentifier: SportCollectionCell.identifier)
        sportsCollectionView.dataSource = self
        sportsCollectionView.delegate = self
        
        self.view.addSubview(sportsCollectionView)
    }
    
    func createSportsTableView() {
        let sportsTableViewFrame: CGRect = CGRect(x: 0, y: 150, width: Int(view.frame.width), height: Int(view.frame.height) - 250)
        
        let sportsTableView: UITableView = UITableView(frame: sportsTableViewFrame)
        sportsTableView.register(SportTableCell.self, forCellReuseIdentifier: SportTableCell.identifier)
        sportsTableView.dataSource = self
        sportsTableView.delegate = self
        sportsTableView.separatorInset = UIEdgeInsets.zero
        
        self.view.addSubview(sportsTableView)
    }
    
    @objc func searchButtonHandler() {
        
    }
    
    @objc func showCollectionLayout(sender: UIButton) {
        if layout != "collection" {
            layout = "collection"
        }
        
        createElements()
    }
    
    @objc func showTableLayout(sender: UIButton) {
        if layout != "table" {
            layout = "table"
        }
        
        createElements()
    }
}

extension SportsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsMock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionCell.identifier, for: indexPath) as! SportCollectionCell
        
        let sport: Sport = sportsMock[indexPath.row]
        
        cell.configureImage(image: sport.image)
        cell.configureLabel(text: sport.name.capitalized)
        
        return cell
    } 
}

extension SportsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sport: Sport = sportsMock[indexPath.row]
        
        let competitionsViewController: CompetitionsViewController = CompetitionsViewController(sport: sport)
        
        navigationController?.pushViewController(competitionsViewController, animated: true)
    }
}

extension SportsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 25) / 4, height: (collectionView.frame.width - 25) / 4 + 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension SportsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SportTableCell = tableView.dequeueReusableCell(withIdentifier: SportTableCell.identifier) as! SportTableCell
        
        let sport: Sport = sportsMock[indexPath.row]
        
        cell.configureImage(image: sport.image)
        cell.configureLabel(text: sport.name.capitalized)
        
        return cell
    }
}

extension SportsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sport: Sport = sportsMock[indexPath.row]
        
        let competitionsViewController: CompetitionsViewController = CompetitionsViewController(sport: sport)
        
        navigationController?.pushViewController(competitionsViewController, animated: true)
    }
}
