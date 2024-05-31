//
//  FeaturedEvent.swift
//  Eventy
//
//  Created by Vraj Shah on 21/06/23.
//

import SwiftUI

struct FeaturedEvent {
    let titleImage: Image
    let title: String
    let location: String
    let date: String
    let month: String
}

extension FeaturedEvent {
    static var indonesianEvent = FeaturedEvent(titleImage: appImage.eventTitleImage.image, title: appString.indonesiaEventTitle(), location: appString.indonesiaEventLocation(), date: appString.indonesiaEventDate(), month: appString.indonesiaEventMonth())
}
