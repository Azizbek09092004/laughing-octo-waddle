//
//  BunnerView.swift
//  Uzum Tezkor App
//
//  Created by islombek on 07/02/24.
//

import UIKit

class BannerView: UIViewController {

    // MARK: - UI Elements
    
    
    var currentImageIndex = 1
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Maxsus Chegirmalar"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bannerwall"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let backgroundShadow: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bannershadow"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let advertisingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = .raz1
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Ajoyib mahsulotlarni ajoyib narxlarda kashf eting. Cheklangan vaqt taklifi!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let ctaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buyurtma qilish!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =  UIColor(red: 94/255.0, green: 36/255.0, blue: 243/255.0, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        return button
    }()

    
    let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Shartlar amal qiladi. 90 000 so'mdan dan ortiq buyurtmalar uchun bepul yetkazib berish."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startImageViewAnimation()    }

    // MARK: - UI Setup

    func setupUI() {
        view.addSubview(backgroundImage)
        view.addSubview(backgroundShadow)
        view.addSubview(headerLabel)
        view.addSubview(advertisingImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(ctaButton)
        view.addSubview(additionalInfoLabel)
        view.addSubview(backButton)
        
        // Add constraints for each UI element
        advertisingImageView.clipsToBounds = true
        
        backgroundShadow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundShadow.topAnchor.constraint(equalTo: view.topAnchor, constant: -200),
            backgroundShadow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundShadow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundShadow.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -5),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        advertisingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            advertisingImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
            advertisingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            advertisingImageView.widthAnchor.constraint(equalToConstant: 200),
            advertisingImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: advertisingImageView.bottomAnchor, constant: 300),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ctaButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            ctaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ctaButton.widthAnchor.constraint(equalToConstant: 200),
            ctaButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        additionalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            additionalInfoLabel.topAnchor.constraint(equalTo: ctaButton.bottomAnchor, constant: 16),
            additionalInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            additionalInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    func startImageViewAnimation() {
        UIView.animate(withDuration: 2.5, delay: 0.0, options: [.autoreverse, .repeat, .curveEaseInOut], animations: {
            // Zoom-in
            self.advertisingImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            // Completion block to handle the end of the zoom-in animation
            UIView.transition(with: self.advertisingImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                // Change the image after zoom-in
                self.advertisingImageView.image = UIImage(named: "raz\(self.currentImageIndex)")
            }, completion: { _ in
                // Reset the transform to the identity to avoid layout conflicts
                self.advertisingImageView.transform = .identity
                
                // Increase the currentImageIndex or reset it to 1 if it reaches 3
                self.currentImageIndex = (self.currentImageIndex % 3) + 1
                
                // Restart the animation
                self.startImageViewAnimation()
            })
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabBarController?.tabBar.isHidden = true
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            tabBarController?.tabBar.isHidden = false
        }

    // MARK: - Button Actions

    @objc func ctaButtonTapped() {
        // Implement action when the CTA button is tapped
        pushVC(with: BuyurtmaViewController())
    }

    @objc func backButtonTapped() {
        // Implement action when the back button is tapped
        navigationController?.popViewController(animated: true)
    }
}

