import SwiftUI

struct AdminView: View {
    @State private var locationName = ""
    @State private var nextLocationName = ""

    var body: some View {
    NavigationView {
      Form {
        Section(
          header: Text("Location Setup"),
          footer: Text("This will clear previous data from tag.")
            .fontWeight(.bold)
        ) {
          TextField("Enter Location Name", text: $locationName)
            .autocapitalization(.words)
            TextField("Enter Next Location", text: $nextLocationName)
              .autocapitalization(.words)
          // swiftlint:disable multiple_closures_with_trailing_closure multiline_arguments
          Button(action: {
              NFCUtility.performAction(.setupLocation(locationName: self.locationName, nextLocationName: self.nextLocationName)) { _ in
              self.locationName = ""
              self.nextLocationName = ""
            }
          }) {
            Text("Save Location…")
          }
          .disabled(locationName.isEmpty)
          .disabled(nextLocationName.isEmpty)
        }
        // swiftlint:enable multiple_closures_with_trailing_closure multiline_arguments
      }
      .navigationBarTitle("Administration")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    }

    private func endEditing() {
      UIApplication.shared.endEditing()
    }

}

struct AdminView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
