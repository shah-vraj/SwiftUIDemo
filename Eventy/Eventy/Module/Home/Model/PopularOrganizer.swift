//
//  PopularOrganizer.swift
//  Eventy
//
//  Created by Vraj Shah on 21/06/23.
//

import SwiftUI

struct PopularOrganizer {
    let image: Image
    let numberOfEvents: String
    let title: String
}

extension PopularOrganizer {
    static var spaceXTechOrganizer = PopularOrganizer(image: appImage.spaceXTechImage.image, numberOfEvents: appString.hundredPlusEvents(), title: appString.spaceXTech())
    static var skateboardFestOrganizer = PopularOrganizer(image: appImage.skateboardImage.image, numberOfEvents: appString.hundredPlusEvents(), title: appString.skateboardFest())
    static var visualProjectionOrganizer = PopularOrganizer(image: appImage.visualProjectionImage.image, numberOfEvents: appString.hundredPlusEvents(), title: appString.visualProjection())
}
