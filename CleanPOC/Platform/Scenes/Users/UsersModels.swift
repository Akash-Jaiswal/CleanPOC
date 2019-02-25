//
//  UsersModels.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
enum Users
{
    enum LoadUsers
    {
        struct Request
        {

        }
        enum Response
        {
            case success(response: [UserModel])
            case failure(error: Error)
        }
        struct ViewModel
        {
            var users: [UserModel]
        }
    }
    
    
    // MARK: - Use cases
    enum UserDetails {
        struct Request {
            var username: String
        }
        enum Response {
            case success
            case failure(error: Error)
        }
        struct ViewModel {
            
        }
    }
}
