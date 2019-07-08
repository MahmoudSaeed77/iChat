//
//  CustomCell.swift
//  iChat
//
//  Created by Mohamed Ibrahem on 7/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        addSubview(logoutButton)

        
        NSLayoutConstraint.activate([
            
            
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoutButton.heightAnchor.constraint(equalTo: heightAnchor)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.textColor = .red
        return button
    }()
    
    
}
