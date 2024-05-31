//
//  BaseObservableObject.swift
//  Eventy
//
//  Created by Vraj Shah on 17/06/23.
//

import SwiftUI

class BaseObservableObject: ObservableObject {
    
    //MARK: -
    //MARK: - AppStorage variables
    
    @AppStorage(appString.isLoggedIn()) var isLoggedIn: Bool = false
    @AppStorage(appString.rememberedEmail()) var rememberedEmail: String = ""
    
}//End of class
