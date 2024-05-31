//
//  SignInScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 12/06/23.
//

import SwiftUI
import RealmSwift

struct SignInScreen: View {
    
    var isNavigatedFromSignUp: Bool = false

    @Environment(\.dismiss) var dismiss: DismissAction
    @ObservedObject private var viewModel = SignInViewModel()
    @FocusState private var focusedTextField: TextField?
    
    private enum TextField {
        case email, password
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 44)
            
            VStack(spacing: 20) {
                LeadingImageTextField(leadingImage: Image(appImage.mailIcon), titleKey: appString.emailPlaceholder(), text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.next)
                    .focused($focusedTextField, equals: .email)
                    .onSubmit(of: .text) {
                        focusedTextField = .password
                    }
                
                LeadingImageTextField(leadingImage: Image(appImage.passwordIcon), titleKey: appString.passwordPlaceholder(), isPasswordTextField: true, text: $viewModel.password)
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
                    .focused($focusedTextField, equals: .password)
                
                HStack(alignment: .center) {
                    CheckBox(isChecked: $viewModel.isRememberMeChecked) {
                        Text(appString.rememberMe)
                            .padding(.leading, 8)
                            .font(.custom(appFont.robotoRegular, size: 14))
                            .foregroundColor(appColor.appTextColor.color)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    
                    Text(appString.forgotPassword)
                        .font(.custom(appFont.robotoRegular, size: 14))
                        .foregroundColor(appColor.appBaseColor.color)
                        .underline()
                }
            }
            .padding(.top, 36)
            .padding(.bottom, 40)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 17)
            
            DefaultButton(text: appString.signInTitle()) {
                viewModel.checkAndSignIn()
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
            
            HStack(spacing: 6) {
                Text(appString.dontHaveAnAccount)
                    .font(.custom(appFont.robotoRegular, size: 16))
                    .foregroundColor(appColor.appTextColor.color)
                
                Text(appString.signUpAttributed)
                    .font(.custom(appFont.robotoBold, size: 16))
                    .foregroundColor(appColor.appBaseColor.color)
                    .onTapGesture {
                        isNavigatedFromSignUp ? dismiss() : viewModel.setShouldNavigateToSignUp(true)
                    }
            }
            .padding(.top, 21)
            
            Spacer()
        }
        .defaultNavigationBar(title: appString.signInTitle()) {
            dismiss()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appColor.appGrayColor.color)
        .navigationDestination(isPresented: $viewModel.shouldNavigateToSignUp) {
            SignUpScreen(isNavigatedFromSignIn: true)
        }
        .onTapGesture { focusedTextField = nil }
        .overlay(content: {
            if viewModel.shouldShowToast {
                Toast(message: viewModel.toastMessage ?? "",
                      backgroundColor: .red,
                      textColor: .white,
                      shouldShowToast: $viewModel.shouldShowToast)
            }
        })
        .navigationDestination(isPresented: $viewModel.isLoggedIn) {
            HomeScreen()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
