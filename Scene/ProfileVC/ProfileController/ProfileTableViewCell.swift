//
//  rofileTableViewCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 05/02/24.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
            return imageView
        }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shadow: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(shadow)
        contentView.addSubview(leftImageView)
        contentView.addSubview(rightImageView)
        contentView.addSubview(optionLabel)
    
        optionLabel.textColor = .black
        profileImageView.layer.cornerRadius = 40
        leftImageView.layer.cornerRadius = 17
        shadow.layer.cornerRadius = 20
        leftImageView.tintColor = .appColor.houseIcon
        
    
     NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
      
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            phoneNumberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            leftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            leftImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 30),
            leftImageView.heightAnchor.constraint(equalToConstant: 30),
                    
            shadow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            shadow.widthAnchor.constraint(equalToConstant: 45),
            shadow.heightAnchor.constraint(equalToConstant: 45),
     
            optionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            optionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            optionLabel.widthAnchor.constraint(equalToConstant: 200),
            optionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            rightImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: 20),
            rightImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFirstCell() {
        
        profileImageView.image = UIImage(named: "Islom")
        nameLabel.text = "Axmadjonov Islombek"
        nameLabel.textColor = .black
        phoneNumberLabel.text = "+998975450428"
        phoneNumberLabel.textColor = .black
    }
    
    func configureOtherCell(forCase selectedCase: Int) {
        switch selectedCase {
        case 0:
            optionLabel.text = "Buyurtmalar tarixi"
            leftImageView.image = UIImage(named: "buyurtmalar")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 1:
            optionLabel.text = "Promokodlar"
            leftImageView.image = UIImage(named: "promokodlar")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 2:
            optionLabel.text = "Do'stingizni taklif qil"
            leftImageView.image = UIImage(named: "dostlar")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 3:
            optionLabel.text = "Yordam"
            leftImageView.image = UIImage(named: "yordam")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 4:
            optionLabel.text = "Til"
            leftImageView.image = UIImage(named: "til")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 5:
            optionLabel.text = "Maxfiylik siyosati"
            leftImageView.image = UIImage(named: "maxfiy")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        case 6:
            optionLabel.text = "Foydalanuvchi bilan kelishuv"
            leftImageView.image = UIImage(named: "kelishuv")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
        case 7:
            optionLabel.text = "Chiqish"
            leftImageView.image = UIImage(named: "chiqish")?.withRenderingMode(.alwaysTemplate)
            rightImageView.image = UIImage(named: "next")
            shadow.backgroundColor = UIColor(red: 208/255, green: 222/255, blue: 255/255, alpha: 1.0)
        default:
            break
        }
    }
}


