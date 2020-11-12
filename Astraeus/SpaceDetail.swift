//
//  SpaceDetail.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 10/1/20.
//

import SwiftUI

struct SpaceDetail: View {
    let planetInfo: PlanetInfo?
    
    init(_ newPlanetInfo: PlanetInfo?) {
        planetInfo = newPlanetInfo
    }
    
    var body: some View {
        Text("Details")
    }
}

struct SpaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        SpaceDetail(nil)
    }
}
