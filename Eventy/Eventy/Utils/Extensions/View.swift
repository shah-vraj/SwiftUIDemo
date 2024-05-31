//
//  View.swift
//  Eventy
//
//  Created by Vraj Shah on 12/06/23.
//

import SwiftUI

extension View {
    
    /// Applies the given transform if the given variable is non `nil`
    /// - Parameters:
    ///   - variable: The variable to evaluate
    ///   - transform: The transform to apply to the source `View`
    /// - Returns: Either the original `View` or the modified `View` if the variable is non `nil`
    @ViewBuilder func map<Content: View, T: Any>(_ variable: T?, transform: (T, Self) -> Content) -> some View {
        if let variable {
            transform(variable, self)
        } else {
            self
        }
    }
    
    /// Add a placeholder to the textfield
    /// - Parameters:
    ///   - shouldShow: Bool variable determining if placeholder has to be shown
    ///   - alignment: Alignment of the placeholder and text
    ///   - placeholder: Placeholder to show
    /// - Returns: View with placeholder added according to `shouldShow`
    @ViewBuilder func placeholder<Content: View>(shouldShow: Bool,
                                                 alignment: Alignment = .leading,
                                                 placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    /// Default navigation bar used in the application
    /// - Parameter title: Title to show on navigation bar
    /// - Returns: View representing navigation bar
    func defaultNavigationBar(title: String, onBackPressed: @escaping () -> Void = { }) -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(appColor.appGrayColor.color, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(appImage.backArrow)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                        .onTapGesture { onBackPressed() }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.custom(appFont.robotoBold, size: 22))
                        .foregroundColor(appColor.appTextColor.color)
                }
            }
    }
    
    /// Save the size provided view in `size` variable passed
    /// - Parameter size: variable to store size in
    /// - Returns: original view without any modification
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
    
}//End of extension
