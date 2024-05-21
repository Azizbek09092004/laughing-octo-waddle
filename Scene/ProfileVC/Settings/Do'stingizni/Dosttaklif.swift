//
//  Dosttaklif.swift
//  Uzum Tezkor App
//
//  Created by islombek on 09/02/24.
//

import UIKit

class InviteFriendViewController: UIViewController {

    private let inviteLinkLabel: UILabel = {
        let label = UILabel()
        label.text = "Do'stingizni Uzumga taklif qiling:"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let linkTextView: UITextView = {
        let textView = UITextView()
        textView.text = "https://yumeats.uz"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = .blue
        textView.isEditable = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        return textView
    }()
    
    private let copyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Copy Link", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 94/255.0, green: 36/255.0, blue: 243/255.0, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(copyLink), for: .touchUpInside)
        return button
    }()
    
    private let suggestImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "taklifqil"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(inviteLinkLabel)
        view.addSubview(linkTextView)
        view.addSubview(copyButton)
        view.addSubview(suggestImageView)

        inviteLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkTextView.translatesAutoresizingMaskIntoConstraints = false
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        suggestImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inviteLinkLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            inviteLinkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inviteLinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            linkTextView.topAnchor.constraint(equalTo: inviteLinkLabel.bottomAnchor, constant: 20),
            linkTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            linkTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            linkTextView.heightAnchor.constraint(equalToConstant: 100),
            
            copyButton.topAnchor.constraint(equalTo: linkTextView.bottomAnchor, constant: 20),
            copyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copyButton.widthAnchor.constraint(equalToConstant: 120),
            copyButton.heightAnchor.constraint(equalToConstant: 44),
            
            suggestImageView.topAnchor.constraint(equalTo: copyButton.bottomAnchor, constant: 50),
            suggestImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suggestImageView.widthAnchor.constraint(equalToConstant: 500),
            suggestImageView.heightAnchor.constraint(equalToConstant: 250)

        ])
    }

    @objc func copyLink() {
        UIPasteboard.general.string = linkTextView.text
        showAlert(message: "Link nusxalandi!")
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), 
                         NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                           NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        
        let attributedTitle = NSMutableAttributedString(string: "Taklif linki", attributes: titleFont)
        let attributedMessage = NSMutableAttributedString(string: message, attributes: messageFont)
        
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        
        alert.addAction(okAction)

        if let subview = alert.view.subviews.first, let alertContentView = subview.subviews.first {
            alertContentView.backgroundColor = .clear
            alertContentView.layer.cornerRadius = 10
        }
    }
}
