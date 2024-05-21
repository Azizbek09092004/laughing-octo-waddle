//
//  CategoryCelllllll.swift
//  Uzum Tezkor App
//
//  Created by islombek on 05/02/24.
//

import UIKit

final class MaxWayCell: UICollectionViewCell {
    
    let backButton = UIButton(type: .system)
    let searchButton = UIButton(type: .system)
    weak var navigationController: UINavigationController?
    
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(backButton)
        contentView.addSubview(searchButton)
        
        imageView.image = UIImage(named: "MenuWall 1")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        backButton.setImage(UIImage(named: "backwall")?.withRenderingMode(.alwaysTemplate),
                            for: .normal)
        
        searchButton.tintColor = .white
        searchButton.setImage(UIImage(named: "searchwall")?.withRenderingMode(.alwaysTemplate),
                              for: .normal)
        

        searchButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 30),  // Adjust width as needed
            backButton.heightAnchor.constraint(equalToConstant: 30),
   
            searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.widthAnchor.constraint(equalToConstant: 30),  // Adjust width as needed
            searchButton.heightAnchor.constraint(equalToConstant: 30)// Adjust height as needed
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}







final class MaxWayCell2: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2.25, height: UIScreen.main.bounds.height / 4.8)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Uzum Tezkordan lavash set"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let promoLabel: UILabel = {
        let label = UILabel()
        label.text = "160,000 so'm"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 0
        stepper.maximumValue = 10 // Set the maximum value according to your requirements
        stepper.stepValue = 1
        return stepper
    }()

    let stepperCountLabel: UILabel = {
           let label = UILabel()
           label.text = "0"
           label.textColor = .black
           label.font = UIFont.systemFont(ofSize: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        animateAppearance()
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(promoLabel)
        contentView.addSubview(stepper)
        contentView.addSubview(stepperCountLabel)
        
        imageView.layer.cornerRadius = 10
        imageView.image = .menuitem
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            promoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            promoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            promoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            stepper.topAnchor.constraint(equalTo: promoLabel.bottomAnchor, constant: 12),
            stepper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stepper.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            stepperCountLabel.topAnchor.constraint(equalTo: promoLabel.bottomAnchor, constant: 15),
            stepperCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 125),
            stepperCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stepperCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    @objc func stepperValueChanged(_ stepper: UIStepper) {
        // Update the stepper count label with animation
        UIView.transition(with: stepperCountLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.stepperCountLabel.text = "\(stepper.value)"
        }, completion: nil)
    }
    
    func animateAppearance() {
            contentView.alpha = 0
            UIView.animate(withDuration: 0.3) {
                self.contentView.alpha = 1
            }
        }
}
