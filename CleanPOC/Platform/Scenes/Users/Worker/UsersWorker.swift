//
//  UsersWorker.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

typealias LoadUsersCompletionHandler = (_ result: Response<[UserModel]>) -> ()
typealias LoadImageCompletionHandler = (_ result: Response<String>) -> ()
class UsersWorker {
    
    func doLoadUsers(completionHandler: @escaping LoadUsersCompletionHandler) {
        UsersAPI.shared.getAllUser { response in
            completionHandler(response)
        }
    }
    
    func doLoadImage(forUser user: String, completionHandler: @escaping LoadImageCompletionHandler) {
        UsersAPI.shared.getImage(forUser: user, completion: { (response) in
             completionHandler(response)
        })
           
    }
}
