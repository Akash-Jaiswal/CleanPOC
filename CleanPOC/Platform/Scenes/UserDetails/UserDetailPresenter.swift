//
//  UserDetailPresenter.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
protocol UserDetailPresentationLogic {
    func presentUserDetail(response: UserDetail.GetUserDetails.Response)
    
}
class UserDetailPresenter: UserDetailPresentationLogic {
     weak var viewController: UserDetailDisplayLogic?
    func presentUserDetail(response: UserDetail.GetUserDetails.Response) {
        let viewModel = UserDetail.GetUserDetails.ViewModel(username: response.username, userImageUrl: response.userImageUrl)
        viewController?.displayUserImage(viewModel: viewModel)
    }
    
}
