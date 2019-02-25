//
//  UsersView.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import UIKit

class UsersView: UIView {
    // MARK:- Properties:
    var usersTableView: UITableView
    let spinner  = UIActivityIndicatorView(style: .gray)
    
    // MARK:- Initializers:
    init() {
        usersTableView = UITableView(frame: .zero, style: .plain)
        
        super.init(frame: CGRect.zero)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    private func setupComponents() {
        // self
        backgroundColor = UIColor.white
        
       
        
        usersTableView.showsVerticalScrollIndicator = true
        usersTableView.showsHorizontalScrollIndicator = false
        usersTableView.backgroundColor = .clear
        addSubview(usersTableView)
        // spinner
        addSubview(spinner)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // spinner
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            usersTableView.topAnchor.constraint(equalTo: topAnchor),
            usersTableView.leftAnchor.constraint(equalTo: leftAnchor),
            usersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            usersTableView.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

