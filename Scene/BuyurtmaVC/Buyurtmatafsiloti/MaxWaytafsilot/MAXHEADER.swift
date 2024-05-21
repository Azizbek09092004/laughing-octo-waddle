//
//  MAXHEADER.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import UIKit

class HeaderViewmax: UITableViewHeaderFooterView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let other: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minitit: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(other)
        addSubview(minitit)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            
            minitit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            minitit.topAnchor.constraint(equalTo: topAnchor, constant: 47),
            
            other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            other.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        self.backgroundView?.backgroundColor = .white
    }
}
