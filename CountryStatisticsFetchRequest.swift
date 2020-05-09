//
//  CountryStatisticsFetchRequest.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 09/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {
  
  @Published var detailCountryData: DetailedCountryData?
  
  let headers: HTTPHeaders = [
    "x-rapidapi-host": "covid-193.p.rapidapi.com",
    "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
  ]
  
  init() {
    
  }
  
  func getStatsFor(country: String) {
    
    AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
      
      let result = response.data
      
      if result != nil {
        
        let json = JSON(result!)
        //        print(json)
        let country = json["response"][0]["country"].stringValue
        
        let deaths = json["response"][0]["deaths"]["total"].intValue
        let newDeaths = json["response"][0]["deaths"]["new"].intValue
        
        let tests = json["response"][0]["tests"]["total"].intValue
        
        let criticalCases = json["response"][0]["cases"]["critical"].intValue
        let totalCases = json["response"][0]["cases"]["total"].intValue
        let activeCases = json["response"][0]["cases"]["active"].intValue
        let newCases = json["response"][0]["cases"]["new"].intValue
        let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
        
        self.detailCountryData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
        
      }
    }
  }
}
