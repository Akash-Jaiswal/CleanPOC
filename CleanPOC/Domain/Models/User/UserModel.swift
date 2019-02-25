//
//  UserModel.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

struct UserModel {
    var id: Int
    var first_name: String
    var last_name : String
    var avatar : String
    
    init?(dict: [String: Any]) {
        guard
            let id = dict["id"] as? Int,
            let first_name = dict["first_name"] as? String,
            let last_name = dict["last_name"] as? String,
            let avatar = dict["avatar"] as? String
            else
        {
                return nil
                
        }
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.avatar = avatar
        
    }
}
