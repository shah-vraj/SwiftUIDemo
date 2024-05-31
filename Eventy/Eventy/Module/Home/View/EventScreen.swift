//
//  EventScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

struct EventScreen: View {
    
    @Environment(\.dismiss) var dismiss: DismissAction
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var navigationBarSize: CGSize = .zero
    @State private var showLogOutAlert: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                FeaturedEvents()
                    .padding(.top, 10)
                
                CategoryEvents()
                    .padding(.top, 20)
                
                PopularOranizers()
                    .padding(.top, 20)
            }
            .padding(.top, navigationBarSize.height)
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize)
            
            NavigationBar(onSideMenuClick: {
                showLogOutAlert = true
            })
                .saveSize(in: $navigationBarSize)
        }
        .alert(appString.logOutAlertTitle(), isPresented: $showLogOutAlert) {
            Button("Cancel", role: .cancel) {
                debugPrint("Cancel logout")
            }
            Button("Ok") {
                viewModel.isLoggedIn = false
                dismiss()
            }
        }
    }
}

//MARK: -
//MARK: - Viewbuilder extension

extension EventScreen {
    
    @ViewBuilder private func FeaturedEvents() -> some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.featuredEvents.indices, id: \.self) {
                    FeaturedEvent(event: viewModel.featuredEvents[$0])
                }
            }
        }
        .scrollIndicators(.hidden)
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder private func FeaturedEvent(event: FeaturedEvent) -> some View {
        VStack(spacing: 0) {
            event.titleImage
                .frame(width: 313, height: 174)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.title)
                        .font(.custom(appFont.robotoBold, size: 15))
                        .foregroundColor(appColor.appTextColor.color)
                    
                    Text(event.location)
                        .font(.custom(appFont.robotoRegular, size: 13))
                        .foregroundColor(appColor.appTextColor.color)
                    
                    Spacer()
                        .frame(height: 8)
                    
                    HStack(spacing: 7) {
                        appImage.avatarsIcon.image
                        
                        Text(appString.interested)
                            .font(.custom(appFont.robotoRegular, size: 13))
                            .foregroundColor(appColor.appBaseColor.color)
                    }
                }
                .padding(.leading, 18)
                .padding(.top, 12)
                .padding(.bottom, 16)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    VStack(spacing: 0) {
                        Group {
                            Text(event.date)
                                .font(.custom(appFont.robotoBold, size: 27))
                            Text(event.month)
                                .font(.custom(appFont.robotoBold, size: 15))
                        }
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 8)
                    .padding(.top, 2)
                    .padding(.bottom, 12)
                    .background(appColor.appBaseColor.color)
                    .clipShape(RoundedCorner(radius: 25, corners: [.bottomLeft, .bottomRight]))
                    
                    HStack(spacing: 10) {
                        Text(appString.going)
                            .foregroundColor(appColor.appBaseColor.color)
                            .font(.custom(appFont.robotoRegular, size: 13))
                        
                        appImage.downArrowIcon.image
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(appColor.appBaseColor.color.opacity(0.1))
                    .clipShape(Capsule())
                }
                .padding(.trailing, 9)
                .padding(.bottom, 14)
            }
            .frame(width: 313)
            .background(Color.white)
            .clipShape(RoundedCorner(radius: 10, corners: [.bottomLeft, .bottomRight]))
        }
    }
    
    @ViewBuilder private func CategoryEvents() -> some View {
        VStack(spacing: 20) {
            HStack {
                Text(appString.categoryEvents)
                    .font(.custom(appFont.robotoBold, size: 18))
                    .foregroundColor(appColor.appTextColor.color)
                
                Spacer()
                
                Text(appString.viewAllButtonTitle)
                    .font(.custom(appFont.robotoBold, size: 14))
                    .foregroundColor(appColor.appBaseColor.color)
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.categoryEvents.indices, id: \.self) {
                        CategoryEvent(event: viewModel.categoryEvents[$0])
                    }
                }
            }
            .scrollIndicators(.hidden)
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder private func CategoryEvent(event: CategoryEvent) -> some View {
        VStack(spacing: 12) {
            event.image
            
            Text(event.title)
                .font(.custom(appFont.robotoBold, size: 14))
                .foregroundColor(appColor.appTextColor.color)
        }
        .padding(.top, 23)
        .padding(.bottom, 13)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    @ViewBuilder private func PopularOranizers() -> some View {
        VStack(spacing: 20) {
            HStack {
                Text(appString.popularOrganizer)
                    .font(.custom(appFont.robotoBold, size: 18))
                    .foregroundColor(appColor.appTextColor.color)
                
                Spacer()
                
                Text(appString.viewAllButtonTitle)
                    .font(.custom(appFont.robotoBold, size: 14))
                    .foregroundColor(appColor.appBaseColor.color)
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.popularOrganizers.indices, id: \.self) {
                        PopularOrganizer(organizer: viewModel.popularOrganizers[$0])
                    }
                }
            }
            .scrollIndicators(.hidden)
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder private func PopularOrganizer(organizer: PopularOrganizer) -> some View {
        VStack(spacing: 8) {
            organizer.image
            
            Text(organizer.numberOfEvents)
                .font(.custom(appFont.robotoBold, size: 10))
                .foregroundColor(appColor.appTextColor.color)
            
            Text(organizer.title)
                .font(.custom(appFont.robotoBold, size: 12))
                .foregroundColor(appColor.appBaseColor.color)
            
            Text(appString.follow)
                .font(.custom(appFont.robotoBold, size: 12))
                .foregroundColor(appColor.appBaseColor.color)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(appColor.appBaseColor.color.opacity(0.1))
                .clipShape(Capsule())
        }
        .padding(.bottom, 12)
        .background(Color.white)
        .cornerRadius(10)
    }
    
}

//MARK: -
//MARK: - Private views

private struct NavigationBar: View {
    
    var onSideMenuClick: () -> Void = { }
    var onSearchClick: () -> Void = { }
    var onNotificationClicked: () -> Void = { }
    
    var body: some View {
        ZStack {
            HStack {
                Image(appImage.sideMenuIcon)
                    .padding(12)
                    .background(Color.white)
                    .clipShape(Circle())
                    .onTapGesture(perform: onSideMenuClick)
                
                Spacer()
                
                HStack {
                    Image(appImage.searchIcon)
                        .padding(12)
                        .background(Color.white)
                        .clipShape(Circle())
                        .onTapGesture(perform: onSearchClick)
                    
                    ZStack(alignment: .topTrailing) {
                        Image(appImage.notificationIcon)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        Text("2")
                            .font(.custom(appFont.robotoBold, size: 14))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(appColor.appBaseColor.color)
                            .clipShape(Circle())
                            .offset(x: 8, y: -8)
                    }
                    .onTapGesture(perform: onNotificationClicked)
                }
            }
            .padding(.horizontal, 20)
            
            Text(appString.home)
                .font(.custom(appFont.robotoBold, size: 22))
                .foregroundColor(appColor.appTextColor.color)
        }
        .frame(alignment: .center)
        .padding(.bottom, 10)
        .background(appColor.appGrayColor.color)
    }
}

struct EventScreen_Previews: PreviewProvider {
    static var previews: some View {
        EventScreen()
            .environmentObject(HomeViewModel())
    }
}
