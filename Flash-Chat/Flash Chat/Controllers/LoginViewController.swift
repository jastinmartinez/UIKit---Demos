//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let email = emailTextfield.text
        let  password = passwordTextfield.text
        if let _email = email,let _password = password{
            Auth.auth().signIn(withEmail: _email, password: _password) { (authResult, error) in
                if let e = error
                {
                    print(e)
                }else {
                    
                    self.performSegue(withIdentifier: K.signInSegue, sender: self)
                }
            }
        }
    }
    
}
