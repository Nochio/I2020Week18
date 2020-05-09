//
//  RecentView.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 08/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import SwiftUI

struct RecentView: View {
  
    @ObservedObject var fetchCovid = CovidFetchRequest()
    @State var searchText = ""
    @State var isSearchVisible = false
  
  
    var body: some View {
      
      NavigationView {
        
        VStack {
          
          if isSearchVisible {
            SearchView(searchText: $searchText)
          }
          
          TotalDataView(totalData: fetchCovid.totalData)
          ListHeaderView()
          
          List {
            
            ForEach(fetchCovid.allCountries.filter {
              
              self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
              
            }, id: \.country) { countryData in
              
              NavigationLink(destination: CountryDetailView(countryName: countryData.country)) {
                
                CountryDataRowView(countryData: countryData)
                
              }
                
              
            }
            
          }
          
        }//End of stack
        .navigationBarTitle("Recent Data", displayMode: .inline)
            .navigationBarItems(trailing:
                
                Button(action: {
                    
                    self.isSearchVisible.toggle()
                    
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
        )
        
      }//End of NavigationView
      
  }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
