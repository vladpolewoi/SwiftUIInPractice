//
//  SpotifyHomeView.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 11.04.2024.
//

import SwiftUI

struct SpotifyHomeView: View {
  @State private var currentUser: User? = nil
  @State private var selectedCategory: Category? = nil

  var body: some View {
    ZStack {
      Color.spotifyBlack.ignoresSafeArea()

      ScrollView(.vertical) {
        LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders], content: {
          Section {
            ForEach(0 ..< 20) { _ in
              Rectangle()
                .fill(.yellow)
                .frame(width: 200, height: 200)
            }
          } header: {
            header
          }
        })
        .padding(.top, 8)
      }
      .scrollIndicators(.hidden)
      .clipped()
    }
    .task {
      await getData()
    }
    .toolbar(.hidden, for: .navigationBar)
  }

  private func getData() async {
    do {
      currentUser = try await DatabaseHelper().getUsers().first
    } catch {}
  }

  private var header: some View {
    HStack(spacing: 0) {
      ZStack {
        if let currentUser {
          ImageLoaderView(urlString: currentUser.image)
            .background(.spotifyWhite)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .onTapGesture {
              print("Profile")
            }
        }
      }.frame(width: 35, height: 35)

      ScrollView(.horizontal) {
        HStack(spacing: 8) {
          ForEach(Category.allCases, id: \.self) { category in
            SpotifyCategoryCell(
              title: category.rawValue.capitalized,
              isSelected: category == selectedCategory
            )
            .onTapGesture {
              selectedCategory = category
            }
          }
        }
        .padding(.horizontal, 16)
      }
      .scrollIndicators(.hidden)
    }
    .padding(.vertical, 24)
    .padding(.leading, 8)
    .background(Color.spotifyBlack)
  }
}

#Preview {
  SpotifyHomeView()
}
