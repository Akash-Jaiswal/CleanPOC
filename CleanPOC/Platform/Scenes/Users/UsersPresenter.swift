//
//  UsersPresenter.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
protocol UsersPresentationLogic {
    func presentUsers(response: Users.LoadUsers.Response)
    func doGoToUserDetail(response: Users.UserDetails.Response)
}

class UsersPresenter: UsersPresentationLogic,UsersDataStore {

    var userList: [UserModel]?
    weak var viewController: UsersDisplayLogic?
    
    func doGoToUserDetail(response: Users.UserDetails.Response) {
        switch response {
        case .success:
            imageSuccess()
        case .failure(let error):
            imageFailure(error: error)
        }
    }
    
    
    func presentUsers(response: Users.LoadUsers.Response) {
        switch response {
        case .success(let responseObj):
             usersSuccess(response: responseObj)
        case .failure(let error):
            usersFailure(error: error)
        }
    }
    
    // MARK: - Private methods
    private func usersSuccess(response: [UserModel]) {
        
        userList = response
        let viewModel = Users.LoadUsers.ViewModel(users: response)
        viewController?.displayUsers(viewModel: viewModel)
    }
    
    private func usersFailure(error: Error) {
        viewController?.displayError()
    }
    private func imageSuccess() {
        let viewModel = Users.UserDetails.ViewModel()
        viewController?.displayUserDetails(viewModel: viewModel)
    }
    
    private func imageFailure(error: Error) {
        viewController?.displayError()
    }
}
