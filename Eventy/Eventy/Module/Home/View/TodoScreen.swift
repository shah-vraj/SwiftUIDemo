//
//  TodoScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

struct TodoScreen: View {
    var body: some View {
        Text(appString.todo)
            .foregroundColor(appColor.appTextColor.color)
            .font(.custom(appFont.robotoBold, size: 32))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TodoScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoScreen()
    }
}
