//
//  UserDetailsViewController.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 18/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import UIKit

protocol UserDetailDisplayLogic: class {
    func displayUserImage(viewModel: UserDetail.GetUserDetails.ViewModel)
    func displayError()
}
class UserDetailsViewController: UIViewController,UserDetailDisplayLogic {
    
    // MARK: - Properties
    var interactor: UserDetailBusinessLogic?
    var router: (NSObjectProtocol & UserDetailRoutingLogic & UserDetailDataPassing)?
    private let userView = UserDetailView()
    // MARK: - Object lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doLoadUserImages()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = UserDetailInteractor()
        let presenter = UserDetailPresenter()
        let router = UserDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: - Private methods
    private func doLoadUserImages() {
        
        let request = UserDetail.GetUserDetails.Request()
        interactor?.doLoadUserDetail(request: request)
    }
    func displayUserImage(viewModel: UserDetail.GetUserDetails.ViewModel) {
        let userImageUrl = URL(string: viewModel.userImageUrl)
        
        if let data = try? Data(contentsOf: userImageUrl!) {
            userView.userImage.image = UIImage(data: data)
        }
        userView.userLabel.text = viewModel.username
    }
    
    func displayError() {
        let alert = UIAlertController(title: "Opps!", message: "Server issue - There is a cat on the server!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
