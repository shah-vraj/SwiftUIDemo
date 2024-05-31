//
//  TabBar.swift
//  Eventy
//
//  Created by Vraj Shah on 19/06/23.
//

import SwiftUI

struct TabBar: View {
    
    var tabBarItems: TabBarItems
    @Binding var selectedTabBarItem: TabBarItem
    
    var body: some View {
        ZStack {
            Image(appImage.tabBarBackground)
                .resizable()
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                HStack(spacing: 30) {
                    SingleTabBarItem(tabBarItem: tabBarItems.first, isSelected: tabBarItems.first == selectedTabBarItem)
                        .onTapGesture { selectedTabBarItem = tabBarItems.first }
                    
                    SingleTabBarItem(tabBarItem: tabBarItems.second, isSelected: tabBarItems.second == selectedTabBarItem)
                        .onTapGesture { selectedTabBarItem = tabBarItems.second }
                }
                
                Spacer()
                
                tabBarItems.center.image
                    .frame(width: 56, height: 56)
                    .background(appColor.appBaseColor.color)
                    .clipShape(Circle())
                    .offset(x: 8, y: -25)
                    .onTapGesture { selectedTabBarItem = tabBarItems.center }
                
                Spacer()
                
                HStack(spacing: 30) {
                    SingleTabBarItem(tabBarItem: tabBarItems.third, isSelected: tabBarItems.third == selectedTabBarItem)
                        .onTapGesture { selectedTabBarItem = tabBarItems.third }
                    
                    SingleTabBarItem(tabBarItem: tabBarItems.fourth, isSelected: tabBarItems.fourth == selectedTabBarItem)
                        .onTapGesture { selectedTabBarItem = tabBarItems.fourth }
                }
            }
            .padding(.horizontal, 30)
            .offset(y: 10)
        }
    }
}

struct SingleTabBarItem: View {
    
    var tabBarItem: TabBarItem
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 7) {
            tabBarItem.image
                .resizable()
                .frame(width: 20, height: 20)
            
            Text(tabBarItem.title)
                .font(.custom(appFont.robotoRegular, size: 12))
                .foregroundColor(isSelected ? appColor.appTextColor.color : appColor.appTextColor.color.opacity(0.5))
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(tabBarItems: TabBarItems(first: TabBarItem.event,
                                        second: TabBarItem.todo,
                                        center: TabBarItem.plus,
                                        third: TabBarItem.explore,
                                        fourth: TabBarItem.profile),
               selectedTabBarItem: .constant(TabBarItem.event))
    }
}
