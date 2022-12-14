//
//  RegisterCoordinator.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 13/12/22.
//

import Foundation
import UIKit

class RegisterCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
