//
//  Toast.swift
//  Eventy
//
//  Created by Vraj Shah on 14/06/23.
//

import SwiftUI

struct Toast: View {
    
    let message: String
    var time: DispatchTime = .now() + 2
    var backgroundColor: Color = .white
    var textColor: Color = .black
    @Binding var shouldShowToast: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(message)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .multilineTextAlignment(.center)
                .font(.custom(appFont.robotoRegular, size: 18))
                .foregroundColor(textColor)
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(color: appColor.tutorialCardShadowColor.color, radius: 20)
                .opacity(shouldShowToast ? 1 : 0)
                .animation(.easeIn(duration: 0.3), value: shouldShowToast)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: time) {
                withAnimation {
                    shouldShowToast = false
                }
            }
        }
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        Toast(message: "Toast Message", shouldShowToast: .constant(true))
    }
}
