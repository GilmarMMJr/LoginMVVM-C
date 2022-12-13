//
//  UserModel.swift
//  LoginMVVMC
//
//  Created by Gilmar Junior on 12/12/22.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email:String, password:String) {
        self.email = email
        self.password = password
    }
}
