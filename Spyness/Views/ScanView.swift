import SwiftUI

struct ScanView: View {
  @State private var clueModel: Clue?

  @State private var hasClue =  true
    
    

  var body: some View {
    ZStack {
        BackgroundView()
        if (clueModel == nil) {
            ScanButton().onTapGesture {
                NFCUtility.performAction(.readClue) { clue in
                    DAO.instance?.addClue(clue: self.clueModel ?? Clue(nextLocation: "test", location: "test"))
                    clueModel = DAO.instance?.getMyClues().last
                }
            }
        } else {
            ZStack {
                VStack (spacing: 60){
                    Text("**You found a new clue!**\nTap on it to go solve it!").foregroundColor(.white).lineSpacing(10)
                    clueModel.map { clue in
                        ClueCardView(clueContent: clue)
                    }
                }.padding(.bottom, 20)
                
                
                
                
            
            }.foregroundStyle(.ultraThickMaterial)
                .padding(.bottom, 20)
        }
    }.onAppear {
        NFCUtility.performAction(.readClue) { clue in
          self.clueModel = try? clue.get()
          DAO.instance?.addClue(clue: self.clueModel ?? Clue(nextLocation: "test", location: "test"))
          self.hasClue = true
        }
    }
  }
}

struct ScanButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 9, height: 9), style: .circular)
                .frame(width: 200, height: 50)
                .foregroundColor(Color(.systemGray))
                .shadow(color: .black, radius: 5, x: 5, y: 5)
                .blendMode(.hardLight)
            Text("Scan tag").foregroundColor(.white)
        }.foregroundStyle(.ultraThickMaterial)
    }
}

struct ScanView_Previews: PreviewProvider {
  static var previews: some View {
      ScanView()
  }
}
