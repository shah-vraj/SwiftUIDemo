//
//  SignInViewModel.swift
//  Eventy
//
//  Created by Vraj Shah on 17/06/23.
//

import SwiftUI

class SignInViewModel: BaseObservableObject {
    
    //MARK: -
    //MARK: - Variables
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isRememberMeChecked: Bool = true
    @Published var shouldNavigateToSignUp: Bool = false
    @Published var shouldShowToast: Bool = false
    @Published var toastMessage: String?
    
    //MARK: -
    //MARK: - Initialization
    
    override init() {
        super.init()
        email = rememberedEmail
    }

    //MARK: -
    //MARK: - Public functions
    
    func setShouldNavigateToSignUp(_ shouldNavigate: Bool) {
        shouldNavigateToSignUp = shouldNavigate
    }
    
    func checkAndSignIn() {
        if let credentialsError = validateCredentials() {
            showToast(message: credentialsError)
            return
        }
        if let userData: UserData = realmHelper.getFirst(UserData.emailPredicate, email) {
            if userData.password != password {
                showToast(message: appString.wrongPassword())
            } else {
                isLoggedIn = true
                rememberedEmail = isRememberMeChecked ? email : ""
                email = rememberedEmail
                password = ""
            }
        } else {
            showToast(message: appString.userNotFound())
        }
    }
    
    //MARK: -
    //MARK: - Private functions
    
    private func validateCredentials() -> String? {
        switch true {
        case email.isEmpty, password.isEmpty:
            return appString.allFieldsRequired()
        case !email.isValidEmail:
            return appString.invalidEmailAddress()
        default:
            return nil
        }
    }
    
    private func showToast(message: String) {
        toastMessage = message
        withAnimation { shouldShowToast = true }
    }
    
}//End of class
