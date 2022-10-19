//
//  MyCluesView.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import SwiftUI

struct MyCluesView: View {
    
    @State private var myClues = DAO.instance?.getMyClues()
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: true) {
                VStack {
                    if let myClues = DAO.instance?.getMyClues() {
                        ForEach(myClues, id: \.self) { clue in
                            ClueCardView(clueContent: clue)
                        }
                        if myClues.isEmpty {
                            Text("You have no clues yet, take a look around!").foregroundColor(.white).lineSpacing(10).padding(.top, 300)
                        }
                    }
                }
            }.padding([.top, .bottom], 60)
        }
    }
}

struct MyCluesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCluesView()
    }
}
