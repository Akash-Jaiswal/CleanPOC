//
//  UserParser.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserParser: JsonParser {
    
     typealias T = [UserModel]
    func parse(fromJSON json: JSON) -> T {
         var usersResponse = [UserModel]()
        guard let usersFromServer = json["data"].array   else  {
            return usersResponse }
        for user in usersFromServer {
            if let dict = user.dictionaryObject{
                if let data = UserModel(dict: dict)
                {
                 usersResponse.append(data)
                }
            }
            
        }
        
//      let users =  usersFromServer.compactMap {
//        UserModel(dict: $0 as! [String : Any])
//        }
        
        return usersResponse
    }
    
}
