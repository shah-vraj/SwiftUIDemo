//
//  FloatingLabelTextField.swift
//  Eventy
//
//  Created by Vraj Shah on 13/06/23.
//

import SwiftUI

struct FloatingLabelTextField: View {
    
    let titleKey: String
    var isPasswordTextField: Bool = false
    
    @Binding var text: String
    
    @State private var isSecured: Bool = true
    
    var body: some View {
        ZStack {
            HStack {
                Text(titleKey)
                    .font(.custom(appFont.robotoRegular, size: text.isEmpty ? 16 : 12))
                    .foregroundColor(appColor.appTextColor.color)
                    .opacity(0.6)
                    .offset(x: 0, y: text.isEmpty ? 0 : -16)
                
                Spacer()
                
                if isPasswordTextField {
                    Image(appImage.passwordEyeIcon)
                        .onTapGesture {
                            isSecured.toggle()
                        }
                }
            }
            .animation(.easeIn(duration: 0.1), value: text.isEmpty)
            
            getTextField()
                .font(.custom(appFont.robotoRegular, size: 16))
                .foregroundColor(appColor.appTextColor.color)
                .autocorrectionDisabled()
                .padding(.trailing, 30)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .padding(.horizontal, 20)
        .background(appColor.appGrayColor.color)
        .cornerRadius(25)
    }
}

extension FloatingLabelTextField {
    
    @ViewBuilder private func getTextField() -> some View {
        if isPasswordTextField {
            if isSecured {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        } else {
            TextField("", text: $text)
        }
    }
    
}//End of extension

struct FloatingLabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingLabelTextField(titleKey: "Enter Text", isPasswordTextField: true, text: .constant("Hello World"))
    }
}
