//
//  User.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 11.04.2024.
//

import Foundation

struct UsersArray: Codable {
  let users: [User]
  let total, skip, limit: Int
}

struct User: Codable, Identifiable {
  let id: Int
  let firstName, lastName: String
  let age: Int
  let email, phone, username, password: String
  let image: String
  let height: Int
  let weight: Double
}
