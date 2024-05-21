//
//  File.swift
//  Uzum Tezkor App
//
//  Created by islombek on 09/02/24.
//


import UIKit

final class GiftCell: UITableViewCell {
    
    static let identifier = "GiftCell"

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = .lightGray

        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(gift: Gift) {
        nameLabel.text = gift.name

        if gift.isSpecial {
            contentView.backgroundColor = .appColor.houseIcon
        } else {
            contentView.backgroundColor = .appColor.houseIcon
        }
    }
}

