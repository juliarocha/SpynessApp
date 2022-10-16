import SwiftUI

struct AppView: View {
    var body: some View {
    TabView {
      VisitorView()
        .tabItem {
          VStack {
            Image(systemName: "magnifyingglass")
            Text("Visitors")
          }
        }
      AdminView()
        .tabItem {
          VStack {
            Image(systemName: "lock")
            Text("Admin")
          }
        }
    }
    .accentColor(Color("rw-green"))
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AppView()
    }
  }
}
