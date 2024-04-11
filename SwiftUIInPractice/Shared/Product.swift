//
//  Product.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 11.04.2024.
//

import Foundation

struct ProductArray: Codable {
  let products: [Product]
  let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
  let id: Int
  let title, description: String
  let price: Int
  let discountPercentage, rating: Double
  let stock: Int
  let brand, category: String
  let thumbnail: String
  let images: [String]
}
