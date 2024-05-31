//
//  ExploreScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

struct ExploreScreen: View {
    var body: some View {
        Text(appString.explore)
            .foregroundColor(appColor.appTextColor.color)
            .font(.custom(appFont.robotoBold, size: 32))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ExploreScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExploreScreen()
    }
}
