//
//  EventyApp.swift
//  Eventy
//
//  Created by Vraj Shah on 08/06/23.
//

import SwiftUI

@main
struct EventyApp: App {
    
    @AppStorage(appString.isTutorialCompleted()) var isTutorialCompleted: Bool = false
    @AppStorage(appString.isLoggedIn()) var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if isTutorialCompleted {
                    if isLoggedIn {
                        HomeScreen()
                    } else {
                        WelcomeScreen()
                    }
                } else {
                    TutorialScreen()
                }
            }
        }
    }
}
