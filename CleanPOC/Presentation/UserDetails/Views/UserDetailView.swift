//
//  UserDetailView.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import UIKit
import Foundation

class UserDetailView: UIView {

// MARK: - Properties
    let spinner  = UIActivityIndicatorView(style: .gray)
    let userLabel = UILabel()
    let userImage = UIImageView(image: UIImage(named: "ProfileImage"))

    // MARK:- Initializers:
    init() {
        super.init(frame: CGRect.zero)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupComponents() {
        // self
        backgroundColor = UIColor.white
        
        userLabel.textAlignment = .center
        addSubview(userLabel)
        
        userImage.contentMode = .scaleAspectFit
        addSubview(userImage)
        
        // spinner
        addSubview(spinner)
        
       
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userLabel.bottomAnchor.constraint(equalTo: userImage.topAnchor, constant: -15.0),
            userLabel.heightAnchor.constraint(equalToConstant: 50.0),
            userLabel.widthAnchor.constraint(equalToConstant: 150.0),
            
            userImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60.0),
            userImage.heightAnchor.constraint(equalToConstant: 200.0),
            userImage.widthAnchor.constraint(equalToConstant: 230.0),
            
            // spinner
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40.0),
            
                   ])
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        spinner.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
         }
}
