//
//  StartNewViewController.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class StartNewViewController: UIViewController {
    
    @IBOutlet weak var roomNumberLabel: UILabel!
    
    var refGames : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uid : String = (Auth.auth().currentUser?.uid)!
        
        SVProgressHUD.show()
        refGames = Database.database().reference()
        refGames.child("games").observeSingleEvent(of: .value) { (snapshot) in
            
            let value = snapshot.value as! NSArray
            let count : Int = value.count
            
            let roomNumber : Int = Int(count * 10000) + Int(arc4random_uniform(10000))
            self.roomNumberLabel.text = String(roomNumber)
            SVProgressHUD.dismiss()
            
            //TODO: - add animation for waiting to player two
            
            var newGame : [String : String] = [String : String]()
            newGame["playerOneUid"] = uid
            newGame["roomNumber"] = String(roomNumber)
            
            value.adding(newGame)
            
            self.refGames.child("games/\(count)").updateChildValues(newGame)
            
        }
        
        
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        
        //show alert "are you sure"
        //TODO: - connect to firebase and close room number
        
        SVProgressHUD.dismiss()
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func notifyPlayerTwoJoined(){
        
        //TODO: - implement this method
    }
    
}




