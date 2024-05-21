//
//  BuyurtmalarTarixiViewcontroller.swift
//  Uzum Tezkor App
//
//  Created by islombek on 09/02/24.
//

import UIKit

class OrderHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let cellIdentifier = "OrderHistoryCell"
    
    // Restaurant data
    let restaurants: [Restaurant] = [
        Restaurant(name: "Oqtepa Lavash", location: "Bodomzor", time: "12:00 PM", image: UIImage(named: "restaurant_a"), cost: "-75 000 so'm"),
        Restaurant(name: "Max Way", location: "Buyuk ipak yoli", time: "14:30 PM", image: UIImage(named: "restaurant_b"), cost: "-124 000 so'm"),
        Restaurant(name: "Evos", location: "Yunusobod", time: "22:32 PM", image: UIImage(named: "restaurant_c"), cost: "-22 000 so'm"),
        Restaurant(name: "Milliy taomlar", location: "Amir Temur ko'chasi", time: "09:12 PM", image: UIImage(named: "restaurant_d"), cost: "-65 000 so'm"),
        Restaurant(name: "Beshqozon", location: "Bodomzor", time: "18:12 PM", image: UIImage(named: "restaurant_e"), cost: "-45 000 so'm"),
        Restaurant(name: "Max Way", location: "Buyuk ipak yoli", time: "01:30 PM", image: UIImage(named: "restaurant_i"), cost: "-124 000 so'm"),
      
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Order History"
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(OrderHistoryTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OrderHistoryTableViewCell
        
        let restaurant = restaurants[indexPath.section]
        cell.configure(restaurant: restaurant)
        
        switch indexPath.section {
            case 0:
                cell.restaurantImageView.image = UIImage(named: "oqtepamenu")
            case 1:
                cell.restaurantImageView.image = UIImage(named: "menuitem")
            case 2:
                cell.restaurantImageView.image = UIImage(named: "evosmenu")
            case 3:
                cell.restaurantImageView.image = UIImage(named: "milliymenu")
            case 4:
                cell.restaurantImageView.image = UIImage(named: "beshqozonmenu")
            case 5:
                cell.restaurantImageView.image = UIImage(named: "menuitem")
           default:
                cell.restaurantImageView.image = UIImage(named: "evosmenu")
            
               
        }
            
        
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

