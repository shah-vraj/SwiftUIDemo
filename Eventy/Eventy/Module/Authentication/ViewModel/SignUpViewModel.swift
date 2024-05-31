//
//  SignUpViewModel.swift
//  Eventy
//
//  Created by Vraj Shah on 17/06/23.
//

import SwiftUI

class SignUpViewModel: BaseObservableObject {
    
    //MARK: -
    //MARK: - Variables
    
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isTermsChecked: Bool = false
    @Published var shouldNavigateToSignIn: Bool = false
    @Published var shouldShowToast: Bool = false
    @Published var toastMessage: String?
    
    var userData: UserData {
        let userData = UserData()
        userData.fullname = fullName
        userData.phoneNumber = phoneNumber
        userData.email = email
        userData.password = password
        return userData
    }
    
    //MARK: -
    //MARK: - Public functions
    
    func setShouldNavigateToSignIn(_ shouldNavigate: Bool) {
        shouldNavigateToSignIn = shouldNavigate
    }
    
    func checkAndSignUp() {
        if let credentialsError = validateCredentials() {
            showToast(message: credentialsError)
            return
        }
        if !isTermsChecked {
            showToast(message: appString.termsNotChecked())
        } else {
            realmHelper.set(object: userData)
            isLoggedIn = true
            rememberedEmail = email
            fullName = ""
            email = ""
            phoneNumber = ""
            password = ""
            confirmPassword = ""
            isTermsChecked = false
        }
    }
    
    //MARK: -
    //MARK: - Private functions
    
    private func validateCredentials() -> String? {
        switch true {
        case fullName.isEmpty, phoneNumber.isEmpty, email.isEmpty, password.isEmpty, confirmPassword.isEmpty:
            return appString.allFieldsRequired()
        case !email.isValidEmail:
            return appString.invalidEmailAddress()
        case phoneNumber.count != 10:
            return appString.invalidPhoneNumber()
        case password != confirmPassword:
            return appString.passwordNotMatching()
        default:
            return nil
        }
    }
    
    private func showToast(message: String) {
        toastMessage = message
        withAnimation { shouldShowToast = true }
    }
    
}//End of class
