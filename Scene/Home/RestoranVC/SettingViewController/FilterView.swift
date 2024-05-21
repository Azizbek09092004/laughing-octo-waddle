//
//  Secondvs.swift
//  Uzum Tezkor App
//
//  Created by islombek on 05/02/24.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let cellHeight: CGFloat = 80.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Filter"
        view.backgroundColor = .white

        // Set up table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterCell")
        view.addSubview(tableView)
        
        // Set up filter button
        let filterButton = UIButton(type: .system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.white, for: .normal)
        filterButton.backgroundColor = .appColor.houseIcon
        filterButton.layer.cornerRadius = 26
        filterButton.layer.shadowColor = UIColor.black.cgColor
        filterButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        filterButton.layer.shadowOpacity = 0.5
        filterButton.layer.shadowRadius = 5

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = filterButton.bounds
        gradientLayer.colors = [
            UIColor.appColor.houseIcon,
            UIColor.appColor.houseIcon        ]
        gradientLayer.cornerRadius = 15
        filterButton.layer.insertSublayer(gradientLayer, at: 0)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        view.addSubview(filterButton)
        
        let backButton = UIButton(type: .system)
            backButton.setTitle("Back", for: .normal)
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            view.addSubview(backButton)
 
        backButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),  // Adjusted constraint
            
            filterButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -100),
            filterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            filterButton.heightAnchor.constraint(equalToConstant: 60)
        ])

    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabBarController?.tabBar.isHidden = true
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            tabBarController?.tabBar.isHidden = false
        }
 
    
    @objc func backButtonTapped() {
           navigationController?.popViewController(animated: true)
       }
    
    @objc func filterButtonTapped() {
        // Implement filter button action here
    }
    
    // MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 127
        } else if indexPath.row == 1 {
            return 155
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.filterImageView.image = UIImage(named: "filtr0")
        case 1:
            cell.filterImageView.image = UIImage(named: "filtr1")
        case 2:
            cell.filterImageView.image = UIImage(named: "filtr2")
        case 3:
            cell.filterImageView.image = UIImage(named: "filtr3")
        case 4:
            cell.filterImageView.image = UIImage(named: "filtr4")
        case 5:
            cell.filterImageView.image = UIImage(named: "filtr5")
        case 6:
            cell.filterImageView.image = UIImage(named: "filtr6")
        case 7:
            cell.filterImageView.image = UIImage(named: "filtr7")
        default:
            break
        }
        return cell
    }
}
