//
//  UsersRouter.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

@objc protocol UsersRoutingLogic {
      func routeToDetails()
}

protocol UsersDataPassing {
    var dataStore: UsersDataStore? { get set }
}

class UsersRouter: UsersRoutingLogic,UsersDataPassing
{
    weak var viewController: UsersViewController?
    var dataStore: UsersDataStore?
    
    func routeToDetails() {
        let destinationVC = UserDetailsViewController()
        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
            
            passDataToShowUserDetail(source: sourceDS, destination: &destinationDS)
        }
        
        if let sourceVC = viewController {
            
            navigate(from: sourceVC, to: destinationVC)
        }
    }
    func passDataToShowUserDetail(source: UsersDataStore, destination: inout UserDetailDataStore)
    {
        let selectedRow = viewController?.usersView.usersTableView.indexPathForSelectedRow?.row
        destination.user = source.userList?[selectedRow!]
    }
    // MARK: Navigation
    func navigate(from source: UsersViewController, to destination: UserDetailsViewController) {
        
        //    source.navigationController?.navigationBar.tintColor = .customOrange
        source.navigationController?.pushViewController(destination, animated: true)
    }
   
}
