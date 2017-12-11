//
//  Login.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/10/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignInService {
    class func signIn(withEmail email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                guard let errorCode = AuthErrorCode(rawValue: error!._code) else { return }
                    switch errorCode {
                    case .userNotFound:
                        self.createUser(withEmail: email, password: password) 
                    case .invalidEmail:
                        print("Your email is invalid")
                    case .wrongPassword:
                        print("Your password is wrong!")
                    default:
                        onFailure(error!)
                }
            } else {
                kUser = user
                onSuccess(user!)
            }
        }
    }

    private class func createUser(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
            } else {
                Auth.auth().signIn(withEmail: email, password: password)
            }
        }
    }

    class func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
