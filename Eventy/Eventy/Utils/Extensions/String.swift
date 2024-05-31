//
//  String.swift
//  Eventy
//
//  Created by Vraj Shah on 14/06/23.
//

import Foundation

extension String {
    
    /// Email address validator
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
}//End of extension
