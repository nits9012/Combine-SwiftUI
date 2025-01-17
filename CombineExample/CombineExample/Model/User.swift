//
//  User.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 15/01/25.
//

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var email: String
    var gender: String?
    var status: String?
}
