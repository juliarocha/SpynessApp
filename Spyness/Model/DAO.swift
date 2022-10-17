//
//  DAO.swift
//  Spyness
//
//  Created by Julia Rocha on 13/10/22.
//

import Foundation


struct DAO: Codable {
    
    static var instance = DAO()
    
    private var myClues:[Clue]
    
    private init? () {
        self.myClues = []
    }
    
    
    public func getMyClues() -> [Clue] {
        return myClues
    }
    
    public mutating func addClue(clue: Clue) {
        print(clue)
        myClues.append(clue)
    }
    
}
