//
//  LoginViewController.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 12/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Clousers
    var onRegisterTap:(() -> Void)?
    var onLoginSuccess:(() -> Void)?
    
    //MARK: - Properts
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegusterTap = {[weak self] in
            self?.onRegisterTap?()
        }
        
        view.onLoginTap = { [weak self] email, password in
            self?.loginTap(email, password)
        }
        
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
    
    private func loginTap(_ email: String, _ password: String) {
        let userViewmodel = UserViewModel()
        userViewmodel.getUserFromApi(email, password) { [weak self] result in
            switch result {
                
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let error):
                self?.showMessager("Error", error.localizedDescription)
            }
        }

    }
    
    func showMessager(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
}
