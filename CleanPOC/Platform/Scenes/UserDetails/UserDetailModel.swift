//
//  UserDetailModel.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
enum UserDetail
{
    enum GetUserDetails {
        struct Request {
            
        }
        struct Response {
            var username: String
            var userImageUrl: String
        }
        struct ViewModel {
            var username: String
            var userImageUrl: String
        }
    }
}
