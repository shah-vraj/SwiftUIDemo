//
//  TabBarItem.swift
//  Eventy
//
//  Created by Vraj Shah on 19/06/23.
//

import SwiftUI

struct TabBarItem: Equatable {
    let index: Int
    let image: Image
    let title: String
    
    static func == (first: TabBarItem, second: TabBarItem) -> Bool {
        first.index == second.index
    }
}

extension TabBarItem {
    static var event = TabBarItem(index: Constants.zero, image: appImage.eventIcon.image, title: appString.event())
    static var todo = TabBarItem(index: Constants.one, image: appImage.todoIcon.image, title: appString.todo())
    static var plus = TabBarItem(index: Constants.two, image: appImage.plusIcon.image, title: appString.plus())
    static var explore = TabBarItem(index: Constants.three, image: appImage.exploreIcon.image, title: appString.explore())
    static var profile = TabBarItem(index: Constants.four, image: appImage.profileIcon.image, title: appString.profile())
}
