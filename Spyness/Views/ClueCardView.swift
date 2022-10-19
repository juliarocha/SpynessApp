//
//  ClueCardView.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import SwiftUI

struct ClueCardView: View {
    
    @State public var clueContent: Clue
    
    var body: some View {
        if !clueContent.status {
            NavigationLink(destination: WordleBoard(clueContent: clueContent)) {
                ClueViewContent(clueContent: clueContent)
            }
        } else {
            ClueViewContent(clueContent: clueContent)
        }

    }
}

struct ClueViewContent: View {
    
    @State public var clueContent: Clue
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 9, height: 9), style: .circular)
                .frame(width: 300, height: 200)
                .foregroundColor(Color(.systemGray))
                .shadow(color: .black, radius: 5, x: 5, y: 5)
                .blendMode(.hardLight)
            StatusLabel(solvedStatus: clueContent.status)
            VStack (alignment: .leading, spacing: 60) {
                Text("**Clue: \(clueContent.clue)**").foregroundColor(.white)
                Text("Found in: \(clueContent.location)").foregroundColor(.white)
            }.padding(.leading, 30)
        }.frame(width: 300, height: 200)
            .foregroundStyle(.ultraThickMaterial)
            .onAppear{
                DAO.instance?.currentClue = clueContent
            }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct StatusLabel: View {
    @State public var solvedStatus: Bool
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .frame(width: 50, height: 200)
                    .foregroundColor( solvedStatus ? Color(.systemGreen) : Color(.systemGray))
                    .blendMode(.hardLight)
                    .cornerRadius(9, corners: [.topLeft, .bottomLeft])
                Spacer()
            }.foregroundStyle(.ultraThickMaterial)
            HStack {
                Text(solvedStatus ? "Solved" : "Not solved")
                    .rotationEffect(.degrees(-90), anchor:
                                        solvedStatus ? .center : UnitPoint(x: 0.4, y: 0.8))
                    .foregroundColor(.white)
                Spacer()
            }
        }.foregroundStyle(.ultraThickMaterial)
        
    }
}

struct ClueCardView_Previews: PreviewProvider {
    static var previews: some View {
        ClueCardView(clueContent: Clue(nextLocation: "test", location: "test2"))
    }
}
