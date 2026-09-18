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
    ZStack {
      Color("Paper")
        .ignoresSafeArea()
      
      VStack(alignment: .leading, spacing: 10) {
        Text("Ethics quote of the day:")
          .font(.headline)
          .padding(.bottom, 50)
        
        Text(quote.text)
          .font(.title)
          .fontDesign(.serif)
          .multilineTextAlignment(.center)
        
        Divider()
          .frame(width: 140)
          .background(.secondary)
          .frame(maxWidth: .infinity, alignment: .center)
          .padding(.vertical, 20)
        
        VStack(alignment: .trailing) {
          if (quote.author != nil) {
            Text(quote.author!)
          }
          
          if (quote.source != nil) {
            Text(quote.source!)
              .italic()
          }
          
          if (quote.year != nil) {
            let yearText = quote.year.map(String.init) ?? ""
            Text(yearText)
          }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 30)
      }
      .padding(.horizontal, 30)
    }
  }
}

#Preview {
    ContentView()
}
