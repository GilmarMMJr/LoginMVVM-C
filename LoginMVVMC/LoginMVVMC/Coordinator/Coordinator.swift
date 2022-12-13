//
//  Coordinator.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 12/12/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    
    func start()
    
    init(navigationController: UINavigationController)
}

class Coordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { }
    
}
