//
//  AddEventScreen.swift
//  Eventy
//
//  Created by Vraj Shah on 20/06/23.
//

import SwiftUI

struct AddEventScreen: View {
    var body: some View {
        Text("Add Event")
            .foregroundColor(appColor.appTextColor.color)
            .font(.custom(appFont.robotoBold, size: 32))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AddEventScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddEventScreen()
    }
}
