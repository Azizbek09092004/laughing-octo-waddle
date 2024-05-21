//
//  MAXCELL.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        addSubview(customImageView)
        backgroundColor = .white 

        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: topAnchor),
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            customImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

