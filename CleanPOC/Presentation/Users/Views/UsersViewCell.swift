//
//  UsersViewCell.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import UIKit

class UsersViewCell: UITableViewCell {
 
    // MARK: - Properties
    var userLabel = UILabel()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupComponents() {
        userLabel.textColor = UIColor.black
        contentView.addSubview(userLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            userLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            userLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            ])
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
