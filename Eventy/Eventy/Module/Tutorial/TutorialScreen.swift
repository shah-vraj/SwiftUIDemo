//
//  TutorialView.swift
//  Eventy
//
//  Created by Vraj Shah on 08/06/23.
//

import SwiftUI
import SwiftUIPager

struct TutorialScreen: View {
    
    @AppStorage(appString.isTutorialCompleted()) var isTutorialCompleted: Bool = false
    
    @StateObject private var pageIndex = Page.first()
    private let pageData = Array(0..<3)
    
    var body: some View {
        ZStack {
            Pager(page: pageIndex, data: pageData, id: \.self) { index in
                getTutorialPage(index: index) {
                    isTutorialCompleted = true
                }
            }
            .pagingPriority(.simultaneous)
            .sensitivity(.high)
            .itemSpacing(25)
            .background(appColor.appGrayColor.color)
            .ignoresSafeArea()
        }
    }
}

private func getTutorialPage(index: Int, onGetStartedClicked: @escaping () -> Void) -> some View {
    switch index {
    case 0:
        return AnyView(tutorialPage(title: appString.welcomeToOnlineEventAppTitle(),
                            description: appString.welcomeToOnlineEventAppDescription(),
                            onGetStartedClicked: onGetStartedClicked) { metrics in
            Image(appImage.welcomeToOnlineEventAppInitialLogo)
                .resizable()
                .frame(width: metrics.size.width * 0.9, height: metrics.size.width * 0.9)
        })
    case 1:
        return AnyView(tutorialPage(title: appString.findAndBookAEventTitle(),
                            description: appString.findAndBookAEventDescription(),
                            onGetStartedClicked: onGetStartedClicked) { metrics in
            ZStack(alignment: .top) {
                Image(appImage.findAndBookAEventLogoBackground)
                    .padding(.top, 35)
                Image(appImage.findAndBookAEventLogoForeground)
            }
            .offset(y: 10)
            .frame(width: metrics.size.width * 0.9, height: metrics.size.width * 0.9)
        })
    case 2:
        return AnyView(tutorialPage(title: appString.organizedAPremiumEventTitle(),
                            description: appString.organizedAPremiumEventDescription(),
                            onGetStartedClicked: onGetStartedClicked) { metrics in
            ZStack(alignment: .top) {
                Image(appImage.organizedAPremiumEventLogoBackground)
                    .padding(.top, 48)
                Image(appImage.organizedAPremiumEventLogoForeground)
            }
            .offset(y: 10)
            .frame(width: metrics.size.width * 0.9, height: metrics.size.width * 0.9)
        })
    default:
        return AnyView(EmptyView())
    }
}

private func tutorialPage<Content: View>(title: String,
                                         description: String,
                                         onGetStartedClicked: @escaping () -> Void,
                                         @ViewBuilder imageView: @escaping (GeometryProxy) -> Content) -> some View {
    GeometryReader { metrics in
        ZStack(alignment: .bottom) {
            appColor.appGrayColor.color
            
            VStack(spacing: 0) {
                imageView(metrics)
                
                VStack {
                    Text(title)
                        .font(.custom(appFont.robotoBold, size: 30))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                        .frame(height: 9)
                    
                    Text(description)
                        .font(.custom(appFont.robotoRegular, size: 18))
                        .foregroundColor(appColor.tutorialDescriptionColor.color)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                        .frame(height: 39)
                    
                    DefaultButton(text: appString.getStarted()) {
                        onGetStartedClicked()
                    }
                    .padding([.leading, .trailing], 40)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 48)
                .padding(.bottom, 100)
                .background(.white)
                .clipShape(RoundedCorner(radius: 50, corners: [.topLeft, .topRight]))
                .shadow(color: appColor.tutorialCardShadowColor.color, radius: 50, x: 0, y: 25)
            }
        }
    }
}

struct TutorialScreen_Previews: PreviewProvider {
    static var previews: some View {
        TutorialScreen()
    }
}
