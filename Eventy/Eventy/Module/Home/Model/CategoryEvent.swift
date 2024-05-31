//
//  CategoryEvent.swift
//  Eventy
//
//  Created by Vraj Shah on 21/06/23.
//

import SwiftUI

struct CategoryEvent {
    let image: Image
    let title: String
}

extension CategoryEvent {
    static var foodEvent = CategoryEvent(image: appImage.foodEventIcon.image, title: appString.foodEvent())
    static var musicEvent = CategoryEvent(image: appImage.musicEventIcon.image, title: appString.musicEvent())
    static var movieEvent = CategoryEvent(image: appImage.movieEventIcon.image, title: appString.movieEvent())
}
