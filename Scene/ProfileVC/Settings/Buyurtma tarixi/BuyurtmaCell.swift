//
//  BuyurtmaCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 09/02/24.
//

import UIKit

final class OrderHistoryTableViewCell: UITableViewCell {
    
     let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 180/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 94/255.0, green: 36/255.0, blue: 243/255.0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        restaurantImageView.image = UIImage(named: "menuitem")
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = .white
    
        addSubview(restaurantImageView)
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(timeLabel)
        addSubview(costlabel)
        
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            restaurantImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            restaurantImageView.widthAnchor.constraint(equalToConstant: 90),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 90),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 16),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            locationLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 16),
            
            costlabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            costlabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 16),
              
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configure(restaurant: Restaurant) {
        restaurantImageView.image = restaurant.image
        nameLabel.text = restaurant.name
        locationLabel.text = restaurant.location
timeLabel.text = restaurant.time
        costlabel.text = restaurant.cost
    }
}

struct Restaurant {
    let name: String
    let location: String
    let time: String
    let image: UIImage?
    let cost: String
}

