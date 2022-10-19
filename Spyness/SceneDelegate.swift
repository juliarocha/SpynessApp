//
//  SceneDelegate.swift
//  Spyness
//
//  Created by Julia Rocha on 14/10/22.
//

import Foundation

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//      let contentView = WordleBoard(clueContent: Clue(nextLocation: "reception", location: "test", status: false))
      let contentView = MainView().tint(.white)
      

      // Use a UIHostingController as window root view controller.
      if let windowScene = scene as? UIWindowScene {
          let window = UIWindow(windowScene: windowScene)
          window.rootViewController = UIHostingController(rootView: contentView)
          self.window = window
          window.makeKeyAndVisible()
      }
  }
}
