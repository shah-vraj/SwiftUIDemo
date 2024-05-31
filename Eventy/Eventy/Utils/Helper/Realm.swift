//
//  Realm.swift
//  Eventy
//
//  Created by Vraj Shah on 14/06/23.
//

import RealmSwift

let realmHelper = RealmHelper.shared

class RealmHelper {
    
    //MARK: -
    //MARK: - Variables
    
    static let shared = RealmHelper()
    private var realm: Realm?
    
    //MARK: -
    //MARK: - Initialization
    
    init() {
        do {
            realm = try Realm()
            debugPrint("Realm file url: ", realm?.configuration.fileURL?.absoluteString ?? "")
        } catch {
            realm = nil
            debugPrint("Cannot create real instance: ", error.localizedDescription)
        }
    }
    
    //MARK: -
    //MARK: - Public functions
    
    func set<T: Object>(object: T) {
        guard let realm else { return }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Cannot write to realm")
        }
    }
    
    func get<T: Object>() -> Results<T>? {
        realm?.objects(T.self)
    }
    
    func get<T: Object>(_ predicateFormat: String, _ args: Any...) -> Results<T>? {
        realm?.objects(T.self).filter(predicateFormat, args)
    }
    
    func getFirst<T: Object>(_ predicateFormat: String, _ args: Any...) -> T? {
        realm?.objects(T.self).filter(predicateFormat, args).first
    }
    
    func get<T: Object>(primaryKey: Any) -> T? {
        realm?.object(ofType: T.self, forPrimaryKey: primaryKey)
    }
    
}//End of class
