//
//  LoginCoordinator.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 12/12/22.
//

import Foundation
import UIKit

class LoginCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            let coordinator = RegisterCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        viewController.onLoginSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}
