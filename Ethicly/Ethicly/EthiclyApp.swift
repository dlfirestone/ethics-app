//
//  EthiclyApp.swift
//  Ethicly
//
//  Created by DM on 9/16/26.
//

import SwiftUI
import EthiclyShared

@main
struct EthiclyApp: App {
  init() {
    QuoteManager.shared.recordFirstLaunchIfNeeded()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
