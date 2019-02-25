//
//  UsersInteractor.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
protocol UsersBusinessLogic {
    func doLoadUsers(request: Users.LoadUsers.Request)
}
protocol UsersDataStore {
   var userList: [UserModel]? { get set }
}

class UsersInteractor: UsersBusinessLogic {
    
    var presenter: UsersPresentationLogic?
     var worker: UsersWorker?
    
    func doLoadUsers(request: Users.LoadUsers.Request) {
        worker = UsersWorker()
        worker?.doLoadUsers(completionHandler: { [weak self] (responseResult) in
            
            var response: Users.LoadUsers.Response
            
            switch responseResult {
            case .success(let succesResponse):
                response = Users.LoadUsers.Response.success(response: succesResponse)
            case .failure(let error):
                response = Users.LoadUsers.Response.failure(error: error)
            }
            self?.presenter?.presentUsers(response: response)
        })
    }
    
    
}
