//
//  MyCluesView.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import SwiftUI

struct MyCluesView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: true) {
                VStack {
                    ClueCardView(clueContent: "RECEPTION", location: "Start Station", solvedStatus: true)
                    ClueCardView(clueContent: "LBOLY", location: "Reception", solvedStatus: false)
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
