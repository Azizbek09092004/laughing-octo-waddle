//
//  LanguageViewcontoller.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import UIKit

class ChangeLanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private let languages: [Language] = [
        Language(name: "Uzbek", flag: "🇺🇿"),
        Language(name: "Russian", flag: "🇷🇺"),
        Language(name: "English", flag: "🇺🇸")
    ]
    
    var selectedLanguage: Language?
    
    private let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 94/255.0, green: 36/255.0, blue: 243/255.0, alpha: 1)
        button.tintColor = .white // Set text color to white for better visibility
        button.layer.cornerRadius = 10 // Add corner radius for a rounded button appearance
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Change Language"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LanguageCell.self, forCellReuseIdentifier: LanguageCell.reuseIdentifier)
        
        view.addSubview(tableView)
        view.addSubview(changeButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: changeButton.topAnchor, constant: -10),
            
            changeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            changeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            changeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.reuseIdentifier, for: indexPath) as! LanguageCell
        
        let language = languages[indexPath.row]
        cell.configure(with: language, isSelected: language == selectedLanguage)
        cell.backgroundColor = .white
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let language = languages[indexPath.row]
        selectedLanguage = language
        
        tableView.reloadData()
    }
    
    // MARK: - Button Action
    
    @objc func changeButtonTapped() {
        if let selectedLanguage = selectedLanguage {
            print("Selected language: \(selectedLanguage.name)")
        } else {
            print("No language selected")
        }
    }
}

struct Language: Equatable {
    let name: String
    let flag: String
}
