//
//  HomeViewModel.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

class HomeViewModel: BaseObservableObject {
    
    //MARK: -
    //MARK: - Variables
    
    let tabBarItems = TabBarItems(first: TabBarItem.event, second: TabBarItem.todo, center: TabBarItem.plus, third: TabBarItem.explore, fourth: TabBarItem.profile)
    let featuredEvents = [FeaturedEvent.indonesianEvent, FeaturedEvent.indonesianEvent, FeaturedEvent.indonesianEvent]
    let categoryEvents = [CategoryEvent.foodEvent, CategoryEvent.musicEvent, CategoryEvent.movieEvent, CategoryEvent.foodEvent]
    let popularOrganizers = [PopularOrganizer.spaceXTechOrganizer, PopularOrganizer.skateboardFestOrganizer, PopularOrganizer.visualProjectionOrganizer, PopularOrganizer.spaceXTechOrganizer]
    
    @Published var selectedTabBarItem: TabBarItem = TabBarItem.event
}
