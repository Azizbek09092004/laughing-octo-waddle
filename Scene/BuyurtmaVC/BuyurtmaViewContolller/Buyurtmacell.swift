//
//  Buyurtmacell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import UIKit

class BuyurtmaCell: UITableViewCell {
    let leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor =  UIColor(red: 94/255.0, green: 36/255.0, blue: 243/255.0, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellViews() {
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        contentView.addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            leftLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
         
            
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            rightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
    
    func configureCell(for row: Int) {
            if row == 0 {
                leftLabel.text = "Max way"
                rightLabel.text = "91 000 so'm  >"
                timeLabel.text = "21 dekabr 13:43 * Yetqazildi"
            } else {
                leftLabel.text = "Besh Qozon"
                rightLabel.text = "64 000 so'm  >"
                timeLabel.text = "4 yanvar dekabr 21:37 * Yetqazildi"
            }
        }
    }

