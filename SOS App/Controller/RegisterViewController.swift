//
//  RegisterViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        registerButton.isEnabled = false
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                //Faild
                print("Oh No!!! \(String(describing: error?.localizedDescription))")
                self.displayError(error: error)
            }
            else {
                //Success
                print("Registration Successful")
                self.performSegue(withIdentifier: "goToMainMenu", sender: self)
            }
            self.registerButton.isEnabled = true
        }
    }
    
    func displayError(error: Error?){
        
        let alert = UIAlertController(title: "Oh No!", message: "Something went wrong... \nPlease try again.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}
