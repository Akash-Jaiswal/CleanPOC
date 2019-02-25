//
//  UsersAPIProtocol.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

protocol UsersAPIProtocol {
    func getAllUser(completion: ((Response<[UserModel]>) -> Void)?)
    func getImage(forUser user: String, completion: ((Response<String>) -> Void)?)
}
