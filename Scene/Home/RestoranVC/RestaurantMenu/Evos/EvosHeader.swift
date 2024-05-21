//
//  EvosHeader.swift
//  Uzum Tezkor App
//
//  Created by islombek on 07/02/24.
//

import UIKit

class EvosHeader: UICollectionReusableView, UISearchBarDelegate {

    let maxWayLabel: UILabel = {
        let label = UILabel()
        label.text = "Evos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = .white
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.layer.borderWidth = 0
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 19)
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: " Qidirmoq", attributes: placeholderAttributes)
        searchBar.searchTextField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        searchBar.tintColor = .black
        searchBar.layer.cornerRadius = 15
        searchBar.layer.masksToBounds = true
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 16)
        searchBar.searchTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true

        if let searchIconView = searchBar.searchTextField.leftView as? UIImageView {
            searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
            searchIconView.tintColor = .appColor.searchbarTint
        }

        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        return searchBar
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel()
        label.text = "Lavash * Burger * Tovuq * Aksiya"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aksiyaLabel: UILabel = {
        let label = UILabel()
        label.text = "Uzum Tezkorda Aksiya"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func zoom(yOffset: CGFloat) {
            let scaleFactor: CGFloat = max(1 - yOffset / 200, 0.8)
            transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    
    func setupUI() {
        addSubview(maxWayLabel)
        addSubview(searchBar)
        addSubview(smallLabel)
        addSubview(aksiyaLabel)
        
        NSLayoutConstraint.activate([
            maxWayLabel.topAnchor.constraint(equalTo: topAnchor, constant:  20),
            maxWayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            maxWayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxWayLabel.heightAnchor.constraint(equalToConstant: 40),
            
            searchBar.topAnchor.constraint(equalTo: smallLabel.bottomAnchor, constant:  20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  5),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            smallLabel.topAnchor.constraint(equalTo: maxWayLabel.bottomAnchor, constant: 5),
            smallLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            smallLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            smallLabel.heightAnchor.constraint(equalToConstant: 20),
            
            aksiyaLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30),
            aksiyaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  15),
            aksiyaLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            aksiyaLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        searchBar.delegate = self
    }
}


