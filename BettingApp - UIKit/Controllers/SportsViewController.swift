//
//  SportsViewController.swift
//  BettingApp - UIKit
//
//  Created by Luka Podrug on 11.09.2023..
//

import UIKit

class SportsViewController: UIViewController {
    var sportsLayoutType = "collection"
    
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
        createMenuBar()
        
        if sportsLayoutType == "collection" {
            createSportsCollectionView()
        }
        else {
            createSportsTableView()
        }
    }
    
    func createMenuBar() {
        let menuBarViewFrame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        let menuBarView = UIView(frame: menuBarViewFrame)
        menuBarView.backgroundColor = .systemGray5
        
        let collectionViewButtonFrame = CGRect(x: menuBarViewFrame.width - 100, y: 0, width: menuBarViewFrame.height, height: menuBarViewFrame.height)
        let collectionViewButton = UIButton(frame: collectionViewButtonFrame)
        collectionViewButton.setImage(UIImage(systemName: "square.grid.3x3"), for: .normal)
        collectionViewButton.backgroundColor = .systemGray3
        
        menuBarView.addSubview(collectionViewButton)
        
        let tableViewButtonFrame = CGRect(x: menuBarViewFrame.width - 50, y: 0, width: menuBarViewFrame.height, height: menuBarViewFrame.height)
        let tableViewButton = UIButton(frame: tableViewButtonFrame)
        tableViewButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        tableViewButton.backgroundColor = .systemGray4
        
        menuBarView.addSubview(tableViewButton)
        
        self.view.addSubview(menuBarView)
    }
    
    func createSportsCollectionView() {
        
    }
    
    func createSportsTableView() {
        
    }
    
    @objc func searchButtonHandler() {
        
    }
}
