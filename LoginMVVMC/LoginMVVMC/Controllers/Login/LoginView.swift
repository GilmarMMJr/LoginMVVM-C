//
//  LoginView.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 13/12/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //MARK: - Clousers
    var onRegusterTap:(() -> Void)?
    var onLoginTap:((_ email: String, _ password: String) -> Void)?
    
    //MARK: - Properts
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .lightGray
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Endereço de email"
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .lightGray
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Informe a senha"
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .viewBackgroundColor
        
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    func setVisualElements() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),

            passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: - Actions
    @objc
    func registerButtonTap() {
        self.onRegusterTap?()
    }
    
    @objc
    func loginButtonTap() {
        if let email = emailTextField.text,
           let password =  passwordTextField.text {
            self.onLoginTap?(email, password)
        } else {
            // - Criar uma menssagem dizendo que os campos tem que ser preenchidos corretamente.
        }
    }
}
