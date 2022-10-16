//
//  Main.swift
//  Spyness
//
//  Created by Julia Rocha on 13/10/22.
//

import SwiftUI

struct MainView: View {
    
    
    
    
    
    var body: some View {
        MainBackgroundView()
    }
    
}




struct MainBackgroundView: View {
    
   
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .blur(radius: 5)
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(1.2)
                VStack (spacing: 80) {
                    
                    Image("icon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: MainTitleView()) {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 9, height: 9), style: .circular)
                                .frame(width: 200, height: 50)
                                .foregroundColor(Color(.systemGray))
                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                .blendMode(.hardLight)
                            Text("Start").foregroundColor(.white)
                        }.foregroundStyle(.ultraThickMaterial)
                    }
                }
            }
        }
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
