//
//  CountryDetailView.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 08/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
  @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
  
  var countryName: String
    
    var body: some View {
        
        VStack {
            VStack {
              CountryDetailRow(number: countryStatisticsRequest.detailCountryData?.confirmedCases.formatNumber() ?? "Error", name: "Confirmed")
                  .padding(.top)
              
              CountryDetailRow(number: countryStatisticsRequest.detailCountryData?.activeCases.formatNumber() ?? "Error", name: "Active Cases")
              
              CountryDetailRow(number: "+" + (countryStatisticsRequest.detailCountryData?.newCases.formatNumber() ?? "Error"), name: "New Cases")
              
              CountryDetailRow(number: countryStatisticsRequest.detailCountryData?.recoveredCases.formatNumber() ?? "Error", name: "Recovered Cases", color: .green)
              
              CountryDetailRow(number: countryStatisticsRequest.detailCountryData?.deaths.formatNumber() ?? "Error", name: "Deaths", color: .red)
              
              CountryDetailRow(number: "+" + (countryStatisticsRequest.detailCountryData?.newDeaths.formatNumber() ?? "Error"), name: "New Deaths", color: .red)
              
              CountryDetailRow(number: countryStatisticsRequest.detailCountryData?.testsDone.formatNumber() ?? "Error", name: "Tests Done", color: .yellow)
              
              CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
              
              CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailCountryData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
              
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
          self.getStatistics()
        }
    }
  
  private func getStatistics() {
    
    countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    
  }
  
}
