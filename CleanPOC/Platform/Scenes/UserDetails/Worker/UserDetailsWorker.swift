//
//  UserDetailsWorker.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
class UserDetailsWorker {
    func doLoadImage(forUser user: String, completionHandler: @escaping LoadImageCompletionHandler) {
        
        UsersAPI.shared.getImage(forUser: user, completion: { (response) in
            completionHandler(response)
        })
    }
}

