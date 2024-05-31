//
//  HomeScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 19/06/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var tabBarSize: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                ContentView(for: viewModel.selectedTabBarItem)
                    .environmentObject(viewModel)
                
                Spacer()
                    .frame(height: tabBarSize.height)
            }
            
            TabBar(tabBarItems: viewModel.tabBarItems, selectedTabBarItem: $viewModel.selectedTabBarItem)
                .saveSize(in: $tabBarSize)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(appColor.appGrayColor.color)
        .toolbar(.hidden, for: .navigationBar)
    }
}

extension HomeScreen {
    
    @ViewBuilder private func ContentView(for tabBarItem: TabBarItem) -> some View {
        switch tabBarItem.title {
        case TabBarItem.event.title:
            EventScreen()
        case TabBarItem.todo.title:
            TodoScreen()
        case TabBarItem.plus.title:
            AddEventScreen()
        case TabBarItem.explore.title:
            ExploreScreen()
        case TabBarItem.profile.title:
            ProfileScreen()
        default:
            EmptyView()
        }
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
