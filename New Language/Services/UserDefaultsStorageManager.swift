//
//  StorageManager.swift
//  New Language
//
//  Created by Kirill Guselnikov on 12.01.2023.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let nameKey = "Name"
    
    private init() {}
    
    func saveName(user: String) {
        var name = fetchName()
        name = user
        userDefaults.set(name, forKey: nameKey)
        print(name)
    }
    
    func fetchName() -> String {
        if let name = userDefaults.string(forKey: nameKey) {
            return name
        }
        return ""
    }    
}
