//
//  UserDetailInteractor.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

protocol UserDetailBusinessLogic {
    func doLoadUserDetail(request: UserDetail.GetUserDetails.Request)
}
protocol UserDetailDataStore {
    var user: UserModel! { get set }
}

class UserDetailInteractor: UserDetailBusinessLogic, UserDetailDataStore {
    var user: UserModel!
    
    // MARK: Properties
    var presenter: UserDetailPresenter?
    var worker: UserDetailsWorker?
    func doLoadUserDetail(request: UserDetail.GetUserDetails.Request) {
        let response = UserDetail.GetUserDetails.Response(username: "\(user.first_name) \(user.last_name)" , userImageUrl: user.avatar )
        presenter?.presentUserDetail(response: response)
    }
    
    
    

}
