//
//  ClueModel.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import Foundation
import CoreNFC

struct Clue: Codable, Hashable {
    
    let clue: String
    let solution: String
    let location: String
    var status: Bool

    init(nextLocation: String, location: String, status: Bool = false ) {
        self.clue = nextLocation.shuffled
        self.solution = nextLocation
        self.location = location
        self.status = status
    }

  init?(message: NFCNDEFMessage) {
    guard
        let clueRecord = message.records.first,
        let clueRead = clueRecord.wellKnownTypeTextPayload().0
      else {
        return nil
    }

      clue = clueRead
      solution = "test"
      location = "test"
      status = false
      
  }
}
