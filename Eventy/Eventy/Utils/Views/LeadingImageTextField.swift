//
//  LeadingImageTextField.swift
//  Eventy
//
//  Created by Vraj Shah on 11/06/23.
//

import SwiftUI

struct LeadingImageTextField: View {
    
    let leadingImage: Image
    let titleKey: String
    var isPasswordTextField: Bool = false
    
    @Binding var text: String
    
    @State private var isSecured: Bool = true
    
    var body: some View {
        HStack(spacing: 15) {
            leadingImage
            
            getTextField()
                .placeholder(shouldShow: text.isEmpty) {
                    Text(titleKey)
                        .font(.custom(appFont.robotoRegular, size: 16))
                        .foregroundColor(appColor.appTextColor.color)
                        .opacity(0.6)
                }
                .font(.custom(appFont.robotoRegular, size: 16))
                .foregroundColor(appColor.appTextColor.color)
                .autocorrectionDisabled()
            
            Spacer()
            
            if isPasswordTextField {
                Image(appImage.passwordEyeIcon)
                    .onTapGesture {
                        isSecured.toggle()
                    }
            }
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 22)
        .background(appColor.appGrayColor.color)
        .cornerRadius(25)
    }
}

extension LeadingImageTextField {
    
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

struct BaseTextField_Previews: PreviewProvider {
    static var previews: some View {
        LeadingImageTextField(leadingImage: Image(appImage.passwordIcon),
                              titleKey: "Enter Text",
                              isPasswordTextField: true,
                              text: .constant("Hello"))
        .previewLayout(.sizeThatFits)
    }
}
