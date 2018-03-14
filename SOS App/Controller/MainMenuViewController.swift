//
//  MainMenuViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    
    let TAG_START : Int = 401
    let TAG_JOIN : Int = 402
    
    @IBOutlet weak var loggedInEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = Auth.auth().currentUser!.email

        loggedInEmail.text!.append(email!)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("oh no! \(error)")
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case TAG_START:
            performSegue(withIdentifier: "goToStartNew", sender: self)
            break
        case TAG_JOIN:
            performSegue(withIdentifier: "goToJoinExisting", sender: self)
            break
        default:
            break
        }
    }
    
    

}
