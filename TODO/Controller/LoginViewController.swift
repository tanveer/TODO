//
//  LoginViewController.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/9/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet private weak var emailStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var loginSignUpButton: UIButton!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                kUser = user
                self.performSegue(withIdentifier: "ViewController", sender: nil)
            } else {
                
            }
        }
    }

    @IBAction private func loginSignUpButtonTapped(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        SignInService.signIn(withEmail: email, password: password, onSuccess: { (user) in
        }) { (error) in
        }
    }
}
