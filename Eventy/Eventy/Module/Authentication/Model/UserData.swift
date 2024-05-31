//
//  UserData.swift
//  Eventy
//
//  Created by Vraj Shah on 13/06/23.
//

import RealmSwift

class UserData: Object {
    @Persisted(primaryKey: true) var id: ObjectId = ObjectId.generate()
    @Persisted var fullname: String
    @Persisted var phoneNumber: String
    @Persisted var email: String
    @Persisted var password: String
    
    static var emailPredicate: String {
        "email == %@"
    }
}
