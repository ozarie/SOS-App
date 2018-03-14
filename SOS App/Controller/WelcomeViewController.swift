//
//  ViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    let TAG_REGISTER : Int = 101
    let TAG_LOGIN : Int = 102

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        if user != nil {
            performSegue(withIdentifier: "goToMainMenu", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case TAG_REGISTER:
            performSegue(withIdentifier: "goToRegister", sender: self)
            break
        case TAG_LOGIN:
            performSegue(withIdentifier: "goToLogin", sender: self)
            break
        default:
            break
        }
    }
    

}

