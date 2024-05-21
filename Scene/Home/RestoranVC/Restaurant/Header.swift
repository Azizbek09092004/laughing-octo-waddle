//
//  Header.swift
//  Uzum Tezkor App
//
//  Created by islombek on 22/01/24.
//
import UIKit

final class HeaderView: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .appColor.upText
        return textField
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField() {
        addSubview(textField)
        
        let houseIcon = UIImageView(image: UIImage(systemName: "house.fill"))
        
        houseIcon.contentMode = .scaleAspectFit
        houseIcon.tintColor = .appColor.houseIcon
        textField.leftView = houseIcon
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 24
        
        let houseImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
        button.setImage(houseImage, for: .normal)
        button.tintColor = .systemRed
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        
        addSubview(button)
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalTo: self.heightAnchor),
            
         
            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
 
}
class HeaderView2: UICollectionReusableView, UISearchBarDelegate {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSearchBar() {
        addSubview(searchBar)
               
               let leadingConstraint = searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
               let trailingConstraint = searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
               let topConstraint = searchBar.topAnchor.constraint(equalTo: self.topAnchor)
               let bottomConstraint = searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor)
               
               NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
               
               searchBar.delegate = self
           }
        
       
    }
    
    
   

class HeaderView3: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Restaurants"
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
