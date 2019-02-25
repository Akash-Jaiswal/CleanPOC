//
//  UserAPI.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
import SwiftyJSON
class UsersAPI
{
   
    // MARK: - Protocol Properties
    static let shared = UsersAPI()
    
    func getAllUser(completion: ((Response<[UserModel]>) -> Void)?) {
        let apiModel = APIModel(method: .get,
                                url: ApiEndPoint.getUserList,
                                headers: nil,
                                params: nil,
                                paramsEncoding: .json)
        
        APIManager.shared.call(withAPIModel: apiModel) { result in
            switch result {
             case .success(let json):
                let users = UserParser().parse(fromJSON: json)
                completion?(Response.success(value: users))
             case .failure(let error):
                completion?(Response.failure(error: error))
            }
        }
    }
    
    func getImage(forUser user: String, completion: ((Response<String>) -> Void)?) {
        let apiModel = APIModel(method: .get,
                                url: user,
                                headers: nil,
                                params: nil,
                                paramsEncoding: .json)
        APIManager.shared.call(withAPIModel: apiModel) { result in
            switch result {
            case .success(let json):
                //let image = ImageParser().parse(fromJSON: json)
                //completion?(Response.success(value: image))
                break
            case .failure(let error):
                completion?(Response.failure(error: error))
            }
        }
    }
    
}
