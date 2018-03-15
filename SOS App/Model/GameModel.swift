//
//  GameModel.swift
//  SOS App
//
//  Created by Oz Arie Tal Shachar on 14/03/2018.
//  Copyright © 2018 Oz Arie Tal Shachar. All rights reserved.
//

import Foundation


class GameModel{

    var roomNumber : Int = Int()
    var playerOneUid : String = String()
    var playerTwoUid : String = String()
    var playerOneScore : Int = 0
    var playerTwoScore : Int = 0
    var isPlayerOneNext : Bool = true
    var moves : [Move] = [Move]()
}
