//
//  UINavigationController.swift
//  Eventy
//
//  Created by Vraj Shah on 13/06/23.
//

import SwiftUI

/// Having a custom navigation bar or hiding it results in disabling default swipe back gesture
/// Adding UINavigationController extension to prevent such issue
extension UINavigationController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
}//End of extension
