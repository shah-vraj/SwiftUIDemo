//
//  CheckBox.swift
//  Eventy
//
//  Created by Vraj Shah on 12/06/23.
//

import SwiftUI

struct CheckBox<Content: View>: View {
    
    @Binding var isChecked: Bool
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                if isChecked {
                    Image(appImage.tickArrowIcon)
                }
            }
            .frame(width: 16, height: 16)
            .background(isChecked ? appColor.appBaseColor.color : appColor.appGrayColor.color)
            .cornerRadius(3)
            .onTapGesture {
                isChecked.toggle()
            }
            
            content()
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(isChecked: .constant(false)) {
            Text(appString.rememberMe)
        }
        .previewLayout(.sizeThatFits)
    }
}
