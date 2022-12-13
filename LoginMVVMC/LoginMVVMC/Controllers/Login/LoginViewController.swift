//
//  LoginViewController.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 12/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properts
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        return view
    }()
    
    //MARK: - Overrides
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
