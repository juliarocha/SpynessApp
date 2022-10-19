//
//  MatrixGrid.swift
//  Spyness
//
//  Created by Julia Rocha on 18/10/22.
//

import Combine
import SwiftUI

struct WordleBoard: View {
    
    @State public var clueContent: Clue
    @State public var solvedClue = false
    @State private var points = 1000
    
    @StateObject private var viewModel = WordleBoardViewModel()
    
    @FocusState private var textFieldActive: Bool
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        ZStack {
            NavigationLink(destination: MainTitleView(), isActive: self.$solvedClue) { EmptyView() }
            BackgroundView()
            VStack (spacing: 80) {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color(.systemGray))
                        .blendMode(.hardLight)
                        .cornerRadius(9, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    Text("Points: \(points)")
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding(.top, 110)
            VStack {
                Text("Unscramble the letters to discover the location of your next clue!")
                    .foregroundColor(.white)
                    .padding([.top, .trailing, .leading], 50)
                    .padding([.bottom], 5)
                    .multilineTextAlignment(.center)
                    
                Text("**\(viewModel.clue.clue)**")
                    .scaleEffect(1.2)
                    .foregroundColor(.white)
                Spacer()
                
            }
            .padding(.top, 140)
            VStack {
                ZStack {
                    TextField("", text: $viewModel.string)
                        .keyboardType(.asciiCapable)
                        .disableAutocorrection(true)
                        .focused($textFieldActive)
                        .opacity(0)
                        .onChange(of: viewModel.string) { [oldString = viewModel.string] newString in
                            viewModel.validateString(newString, previousString: oldString)
                        }
                    MatrixGrid(
                        width: viewModel.width,
                        height: viewModel.height,
                        spacing: 8
                    ) { row, column in
                        LetterBox(
                            letter: viewModel.letters[row][column],
                            evaluation: viewModel.evaluations[row][column]
                        )
                    }
                    .frame(maxHeight: .infinity)
                    .onTapGesture {
                        textFieldActive.toggle()
                    }
                }
                .padding(8)
            }.scaleEffect(0.9)
            Button("Try Again") {
                withAnimation {
                    viewModel.newGame()
                }
            }.foregroundColor(.white)
                .padding(.top, 300)
        }
        .alert("You solved the clue!\nNow go to the location and find the next clue!", isPresented: $viewModel.solved) {
            Button("OK", role: .none) {
                viewModel.solved = false
                DAO.instance?.solveClue(clue: clueContent)
                DAO.instance?.addPoints(points: self.points)
                self.solvedClue = true
            }
        }
        .alert("You didnt figure it out yet... Try again!", isPresented: $viewModel.lost) {
            Button("Try Again", role: .none) {
                viewModel.lost = false
                if self.points > 100 {
                    self.points -= 100
                }
                viewModel.newGame()
            }
        }
    }
    
    private func endEditing() {
      UIApplication.shared.endEditing()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordleBoard(clueContent: Clue(nextLocation: "reception", location: "test", status: false))
    }
}

