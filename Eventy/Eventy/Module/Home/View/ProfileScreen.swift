//
//  ProfileScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        Text(appString.profile)
            .foregroundColor(appColor.appTextColor.color)
            .font(.custom(appFont.robotoBold, size: 32))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
