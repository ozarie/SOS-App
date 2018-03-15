//
//  JoinExistingViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class JoinExistingViewController: UIViewController {
    
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    
    var refGames : DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //TODO: - implement this method
        joinButton.isEnabled = false
        SVProgressHUD.show()
        
        let roomNum : Int = Int(roomTextField.text!)!
        let i : Int = roomNum/10000
        
        print("room = \(roomNum)")
        print("i=\(i)")
        
        refGames = Database.database().reference()
        refGames.child("games/\(i)").observeSingleEvent(of: .value) { (snapshot) in
            
            let value = snapshot.value as! NSDictionary
            let roomNumberDB : Any! = value["roomNumber"]
            print("DB=\(String(describing: roomNumberDB))")
            
            let roomNumAsString : String = String(roomNum)
            let roomNumberDBAsString : String = String(describing: roomNumberDB)
            
            if roomNumAsString==roomNumberDBAsString {
                print("MATCH")
            } else {
                
                print("not match")
            }
            
            print(value)
            
        }
        
        
    }
    
}
