//
//  MainTitle.swift
//  Spyness
//
//  Created by Julia Rocha on 13/10/22.
//

import SwiftUI

struct MainTitleView: View {
    @State private var score = 0
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack(spacing: 80) {
                    // Text("Score: \(score)")

                    NavigationLink(destination: MyCluesView()) {
                        MenuItemView(item: "Clues")
                    }

                    NavigationLink(destination: ScanView()) {
                        MenuItemView(item: "Scan")
                    }
                }.foregroundStyle(.ultraThickMaterial)
                .navigationTitle("Mission 1")
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination: AdminView()) {
                            Image(systemName: "lock").foregroundColor(.white)
                        }
                    )
                }
            }
        .navigationBarHidden(true)
    }
    
}

struct BackgroundView: View {
    var body: some View {
        Image("background")
            .resizable()
            .blur(radius: 2)
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
            .scaleEffect(1.2)
    }
}

struct MenuItemView: View {
    
    var item: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 9, height: 9), style: .circular)
                .frame(width: 200, height: 200)
                .foregroundColor(Color(.systemGray))
                .shadow(color: .black, radius: 5, x: 5, y: 5)
                .blendMode(.hardLight)
            VStack {
                Image("\(item)")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Text("\(item)").foregroundColor(.white)
            }
        }
    }
}


struct MainTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainTitleView()
    }
}
