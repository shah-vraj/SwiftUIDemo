//
//  StrokeButton.swift
//  Eventy
//
//  Created by Vraj Shah on 09/06/23.
//

import SwiftUI

struct StrokeButton: View {
    
    var text: String
    var onClick: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(appColor.appBaseColor.color)
                .font(.custom(appFont.robotoBold, size: 18))
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 15)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(appColor.appBaseColor.color)
                )
                .map(onClick) { onClick, view in
                    view.onTapGesture {
                        onClick()
                    }
                }
        }
    }
}

struct StrokeButton_Previews: PreviewProvider {
    static var previews: some View {
        StrokeButton(text: "Stroke Button")
            .previewLayout(.sizeThatFits)
    }
}
