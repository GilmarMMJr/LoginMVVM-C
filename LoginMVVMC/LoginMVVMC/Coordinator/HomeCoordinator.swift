//
//  HomeCoordinator.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 13/12/22.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
    }
    
    
}
