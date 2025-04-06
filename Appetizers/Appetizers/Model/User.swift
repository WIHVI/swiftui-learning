//
//  User.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 30/03/2025.
//

import Foundation

public struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
