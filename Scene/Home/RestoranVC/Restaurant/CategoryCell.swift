//
//  CategoryCell.swift
//  Korzinka-APP task
//
//  Created by islombek on 17/01/24.
//

import UIKit
import CoreData

protocol CategoryDelegate: AnyObject {
    func didChangeTimer(itemIndex: Int)
}

final class CategoryCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        return imageView
    }()
        
    private var imageIndex = 0
    private var imageTimer: Timer?
    private let imageSwitchingInterval: TimeInterval = 3.0
    private let imageNames: [String] = [
        "reco1", "reco2", "reco3", "reco4", "reco5",
        "reco6", "reco7", "reco8", "reco9"
    ]
    
    weak var delegaet: CategoryDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
// DATA IMAGE SAVE
        
        imageNames.description.utf8
        imageNames.hashValue.codingKey.self
        imageNames.enumerated().lazy.underestimatedCount.customMirror
        
      
    
        
        
        contentView.addSubview(imageView)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
        

        imageTimer = Timer.scheduledTimer(
            timeInterval: imageSwitchingInterval,
            target: self,
            selector: #selector(switchToNextImage),
            userInfo: nil,
            repeats: true
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stopImageAnimation() {
        imageTimer?.invalidate()
        imageTimer = nil
    }
    
    @objc private func switchToNextImage() {
        _ = imageIndex
        imageIndex += 1
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
        delegaet?.didChangeTimer(itemIndex: imageIndex)
    }
    
    func prepare(category: RestaurantCategory, indexPath: IndexPath) {
        let imageName = category.imageName + (indexPath.row + 1).description
        imageView.image = UIImage(named: imageName)
    }
}



final class RecomendationCell: UICollectionViewCell {
    
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 15, y: 85, width: 80, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = .black
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 15
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        imageView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(model: RestaurantRecomendation) {
        imageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
    }
}


final class CategoryCell3: UICollectionViewCell {
    
    let imageView3 = UIImageView()
    let titleLabel3 = UILabel()
    let labelmini = UILabel()
    let button = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView3.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelmini)
        labelmini.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel3)
        titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView3)
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView3.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            imageView3.heightAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel3.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: 5),
            titleLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            titleLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel3.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: -165),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -140),
            button.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            labelmini.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: 30),
            labelmini.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            labelmini.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelmini.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        button.setTitle("           Bepul yetqazib berish", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        
        let circularBackground = UIImageView(image: UIImage(named: "Circle"))
        circularBackground.contentMode = .scaleAspectFit
        circularBackground.frame = CGRect(x: 18, y: 15, width: 32, height: 32)
        circularBackground.layer.cornerRadius = circularBackground.frame.size.width / 2
        circularBackground.clipsToBounds = true
        addSubview(circularBackground)
        
        imageView3.layer.cornerRadius = 15
        titleLabel3.textColor = .black
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 28 )
        labelmini.font = UIFont.systemFont(ofSize: 14)
        labelmini.textColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
