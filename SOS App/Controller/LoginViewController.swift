//
//  WelcomeViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                //Faild
                print("Oh No!!! \(String(describing: error?.localizedDescription))")
            }
            else {
                //Success
                print("Login Successful")
                
                self.performSegue(withIdentifier: "goToMainMenu", sender: self)
            }
        }
    }
    
}
