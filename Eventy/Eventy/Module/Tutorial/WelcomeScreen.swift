//
//  WelcomeScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 12/06/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ZStack(alignment: .top) {
                Image(appImage.welcomeToOnlineEventAppLogoBackground)
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 48)
                    .padding(.trailing, 40)
                Image(appImage.welcomeToOnlineEventAppLogoForeground)
            }
            .offset(y: 10)
            .padding(.horizontal, 26)
            
            VStack {
                Text(appString.welcomeToOnlineEventAppTitle)
                    .font(.custom(appFont.robotoBold, size: 30))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                    .frame(height: 31)
                
                VStack(spacing: 20) {
                    NavigationLink(destination: SignInScreen()) {
                        DefaultButton(text: appString.signInTitle())
                    }
                    
                    NavigationLink(destination: SignUpScreen()) {
                        StrokeButton(text: appString.registerByNo())
                    }
                }
                .padding([.leading, .trailing], 40)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 69)
            .padding(.bottom, 69)
            .background(.white)
            .clipShape(RoundedCorner(radius: 50, corners: [.topLeft, .topRight]))
            .shadow(color: appColor.tutorialCardShadowColor.color, radius: 50, x: 0, y: 25)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appColor.appGrayColor.color)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
