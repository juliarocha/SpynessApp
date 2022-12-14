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
    
    public var currentClue: Clue?
    
    private init? () {
        self.myClues = []
    }
    
    
    public func getMyClues() -> [Clue] {
        return myClues
    }
    
    public mutating func addClue(clue: Clue) {
        myClues.append(clue)
    }
    
    public mutating func solveClue(clue: Clue) {
        guard let index = myClues.firstIndex(of: clue)
        else {
            print("Clue not found in My Clues")
            return
        }
        var solvedClue = clue
        solvedClue.status = true
        myClues[index] = solvedClue
    }
    
}
