//
//  MapContainerView.swift
//  Covid-StatsApp
//
//  Created by Thomas Hinrichs on 08/05/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
  
@ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {

        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}

