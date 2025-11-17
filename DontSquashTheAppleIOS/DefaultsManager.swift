//
//  DefaultsManager.swift
//  DontSquashTheAppleIOS
//
//  Created by  on 11/14/25.
//
import Foundation

class DefaultsManager{
    static func saveToUserDefaults(highScore: Int){
        UserDefaults.standard.set(highScore, forKey: "HighScore")
    }
    static func loadUserDefaults() -> Int{
        let highScore = UserDefaults.standard.integer(forKey: "HighScore")
        return highScore
    }
}
