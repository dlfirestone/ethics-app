//
//  ContentView.swift
//  Ethicly
//
//  Created by DM on 9/16/26.
//

import SwiftUI
import EthiclyShared

struct ContentView: View {
  let quote = QuoteManager.shared.currentQuote()
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
