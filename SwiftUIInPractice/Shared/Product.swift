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
  
  var firstImage: String {
    images.first ?? Constants.randomImage
  }
  
  static var mock: Product {
    Product(
      id: 123,
      title: "Example product title",
      description: "This is some mock product desciption that goes here.",
      price: 256,
      discountPercentage: 12,
      rating: 4.5,
      stock: 87,
      brand: "Apple",
      category: "Electronic Devices",
      thumbnail: Constants.randomImage,
      images: [Constants.randomImage, Constants.randomImage]
    )
  }
}

struct ProductRow: Identifiable {
  let id = UUID().uuidString
  let title: String
  let products: [Product]
}
