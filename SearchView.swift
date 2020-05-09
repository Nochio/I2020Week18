//
//  SearchView.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 08/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import SwiftUI

struct SearchView: View {
  
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}
