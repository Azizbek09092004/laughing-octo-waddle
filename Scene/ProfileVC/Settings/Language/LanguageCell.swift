//
//  LanguageCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import UIKit


final class LanguageCell: UITableViewCell {
    static let reuseIdentifier = "LanguageCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let flagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private let correctIcon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "✅"
        label.isHidden = true
        label.textColor = .green
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(flagLabel)
        contentView.addSubview(correctIcon)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            flagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            flagLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            correctIcon.trailingAnchor.constraint(equalTo: flagLabel.leadingAnchor, constant: -10),
            correctIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with language: Language, isSelected: Bool) {
        nameLabel.text = language.name
        flagLabel.text = language.flag
        correctIcon.isHidden = !isSelected
    }
}


