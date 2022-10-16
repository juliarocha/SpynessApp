//
//  MatrixGrid.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import SwiftUI

struct MatrixGrid: View {
    let rows = [GridItem(.fixed(30))]
    let clue = "RECEPTION"

    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(Array(clue.enumerated()), id: \.offset) { character in
                LetterBox(letter: character.element, evaluation: .match)
                }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct MatrixGrid_Previews: PreviewProvider {
    static var previews: some View {
        MatrixGrid()
    }
}
