//
//  UsersViewController.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import UIKit

protocol UsersDisplayLogic: class {
     func displayUsers(viewModel: Users.LoadUsers.ViewModel)
     func displayUserDetails(viewModel: Users.UserDetails.ViewModel)
     func displayError()
}
class UsersViewController: UIViewController,UsersDisplayLogic {
    
    
   
   var interactor: UsersBusinessLogic?
    var router: UsersRouter?
    let usersView = UsersView()
    var users = [UserModel]()
    fileprivate let userCellIdentifier = "UserViewCell"
    
    func displayUserDetails(viewModel: Users.UserDetails.ViewModel) {
        router?.routeToDetails()
    }
    
    func displayUsers(viewModel: Users.LoadUsers.ViewModel) {
       usersView.spinner.stopAnimating()
        users = viewModel.users
        usersView.usersTableView.reloadData()
    }
    func displayError() {
        let alert = UIAlertController(title: "Opps!", message: "Server issue - There is a cat on the server!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
   
   
    
    // MARK: - Object lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        setupComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setupComponents()
    }
    // MARK: - View lifecycle
    override func loadView() {
        view = usersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Users", comment: String(describing: UsersViewController.self))
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doLoadUsers()
    }
    
    private func setupComponents() {
        usersView.usersTableView.register(UsersViewCell.self, forCellReuseIdentifier: userCellIdentifier)
        usersView.usersTableView.delegate = self
        usersView.usersTableView.dataSource = self
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = presenter as? UsersDataStore
    }

    // MARK: - Private methods
    private func doLoadUsers() {
        usersView.spinner.startAnimating()
        let request = Users.LoadUsers.Request()
        interactor?.doLoadUsers(request: request)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - UICollectionViewDelegate
    
}

// MARK: - Extension UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentCell = tableView.cellForRow(at: indexPath) as? UsersViewCell, let user = currentCell.userLabel.text else {
            return
        }
         router?.routeToDetails()
        
        //let request = Users.UserDetails.Request(username: user)
        //interactor?.doOpenDetails(request: request)
    }
}

// MARK: - Extension UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellIdentifier,
                                                 for: indexPath) as! UsersViewCell
        
        cell.contentView.backgroundColor = (indexPath.row % 2 == 0) ? UIColor.lightGray : UIColor.white
        
        cell.userLabel.text = users[indexPath.row].first_name
        return cell
    }
}

