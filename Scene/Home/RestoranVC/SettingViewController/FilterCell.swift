//
//  cell11.swift
//  Uzum Tezkor App
//
//  Created by islombek on 05/02/24.
//

import UIKit
class FilterTableViewCell: UITableViewCell {
    
    let filterImageView = UIImageView()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        // Set up filter image view
        filterImageView.image = .uza
        filterImageView.clipsToBounds = true
        contentView.addSubview(filterImageView)
        
        // Apply constraintscontentView.addSubview(backButton)
       
        filterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
