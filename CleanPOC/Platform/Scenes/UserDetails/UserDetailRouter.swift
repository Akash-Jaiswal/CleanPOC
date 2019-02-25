//
//  UserDetailWorker.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
@objc protocol UserDetailRoutingLogic { }

protocol UserDetailDataPassing {
    var dataStore: UserDetailDataStore? { get set }
}

class UserDetailRouter: NSObject, UserDetailRoutingLogic, UserDetailDataPassing {
    
    weak var viewController: UserDetailsViewController?
    var dataStore: UserDetailDataStore?
}
