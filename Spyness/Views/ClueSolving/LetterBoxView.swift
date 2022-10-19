//
//  LetterBox.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import SwiftUI

struct LetterBox: View {
    let letter: Character?
    let evaluation: LetterEvaluation?
    
    private var boxColor: Color {
        guard let evaluation = evaluation else {
            return .white
        }
        return evaluation.color
    }
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 4)
                .style(withStroke: Color.black, lineWidth: 1, fill: boxColor)
                .aspectRatio(1, contentMode: .fit)
            if let letter = letter {
                Text(String(letter))
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
        }
    }
}

struct LetterBox_Previews: PreviewProvider {
    static var previews: some View {
        LetterBox(letter: .init("A"), evaluation: .match)
            .previewLayout(.fixed(width: 100, height: 100))
//            .environment(\.colorScheme, .light)
    }
}
