//
//  DefaultButton.swift
//  Eventy
//
//  Created by Vraj Shah on 08/06/23.
//

import SwiftUI

struct DefaultButton: View {
    
    var text: String
    var onClick: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
                .font(.custom(appFont.robotoBold, size: 18))
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 15)
                .background(appColor.appBaseColor.color)
                .cornerRadius(25)
                .map(onClick) { onClick, view in
                    view.onTapGesture {
                        onClick()
                    }
                }
        }
    }
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton(text: "Base Button")
            .previewLayout(.sizeThatFits)
    }
}
