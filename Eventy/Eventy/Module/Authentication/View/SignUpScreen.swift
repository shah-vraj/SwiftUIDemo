//
//  SignUpScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 13/06/23.
//

import SwiftUI

struct SignUpScreen: View {
    
    var isNavigatedFromSignIn: Bool = false
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    @ObservedObject private var viewModel = SignUpViewModel()
    @FocusState private var focusedTextField: TextField?
    
    private enum TextField {
        case fullName, phoneNumber, email, password, confirmPassword
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    ZStack {
                        Image(appImage.cameraIcon)
                    }
                    .frame(width: 100, height: 100)
                    .background(appColor.appGrayColor.color)
                    .clipShape(Circle())
                    
                    FloatingLabelTextField(titleKey: appString.fullName(), text: $viewModel.fullName)
                        .padding(.top, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapable)
                        .focused($focusedTextField, equals: .fullName)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .phoneNumber
                        }
                    
                    FloatingLabelTextField(titleKey: appString.phoneNumber(), text: $viewModel.phoneNumber)
                        .padding(.top, 15)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapableNumberPad)
                        .focused($focusedTextField, equals: .phoneNumber)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .email
                        }
                    
                    FloatingLabelTextField(titleKey: appString.email(), text: $viewModel.email)
                        .padding(.top, 15)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .focused($focusedTextField, equals: .email)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .password
                        }
                    
                    FloatingLabelTextField(titleKey: appString.password(),
                                           isPasswordTextField: true,
                                           text: $viewModel.password)
                    .padding(.top, 15)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .focused($focusedTextField, equals: .password)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedTextField = .confirmPassword
                    }
                    
                    FloatingLabelTextField(titleKey: appString.confirmPassword(),
                                           isPasswordTextField: true,
                                           text: $viewModel.confirmPassword)
                    .padding(.top, 15)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .focused($focusedTextField, equals: .confirmPassword)
                    .submitLabel(.done)
                    
                    CheckBox(isChecked: $viewModel.isTermsChecked) {
                        Text(appString.termsOfServiceAndPrivacyPolicy)
                            .font(.custom(appFont.robotoRegular, size: 16))
                            .foregroundColor(appColor.appTextColor.color)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 28)
                    
                    DefaultButton(text: appString.signUpTitle()) {
                        viewModel.checkAndSignUp()
                    }
                    .padding(.top, 24)
                    
                    HStack(spacing: 6) {
                        Text(appString.alreadyHaveAnAccount)
                            .font(.custom(appFont.robotoRegular, size: 16))
                            .foregroundColor(appColor.appTextColor.color)
                        
                        Text(appString.signInAttributed)
                            .font(.custom(appFont.robotoBold, size: 16))
                            .foregroundColor(appColor.appBaseColor.color)
                            .onTapGesture {
                                isNavigatedFromSignIn ? dismiss() : viewModel.setShouldNavigateToSignIn(true)
                            }
                    }
                    .padding(.top, 21)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 25)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.top, 37)
            .defaultNavigationBar(title: appString.signUpTitle()) {
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appColor.appGrayColor.color)
        .scrollDismissesKeyboard(.interactively)
        .scrollBounceBehavior(.basedOnSize)
        .navigationDestination(isPresented: $viewModel.shouldNavigateToSignIn) {
            SignInScreen(isNavigatedFromSignUp: true)
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

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
