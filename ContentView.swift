//
//  ContentView.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 08/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {

      TabView {
        
        RecentView()
          .tabItem {
            Tab(imageName: "chart.bar", text: "Recent")
        }
        
      .tag(0)
        
      MapContainerView()
          .edgesIgnoringSafeArea(.vertical)
          .tabItem {
              Tab(imageName: "map", text: "Map")
      }
      .tag(1)
        
      }
    }
}

private struct Tab: View {
  
  let imageName: String
  let text: String
  
  var body: some View {
    
    VStack {

      Image(systemName: imageName)
      Text(text)
      
    }
  }
  
}
