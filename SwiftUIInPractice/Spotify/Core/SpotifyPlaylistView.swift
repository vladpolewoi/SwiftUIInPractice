//
//  SpotifyPlaylistView.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 15.04.2024.
//

import SwiftUI

struct SpotifyPlaylistView: View {
  var product: Product = .mock
  var user: User = .mock

  @State private var products: [Product] = []

  var body: some View {
    ZStack {
      Color.spotifyBlack.ignoresSafeArea()

      ScrollView(.vertical) {
        LazyVStack(spacing: 12) {
          PlaylistHeaderCell(
            height: 250,
            title: product.title,
            subtitle: product.description,
            imageName: product.thumbnail
          )

          PlaylistDescriptionCell(
            descriptionText: product.description,
            userName: user.firstName,
            subheadline: product.category,
            onAddToPlaylistPressed: nil,
            onDownloadPressed: nil,
            onSharePressed: nil,
            onEllipsisPressed: nil,
            onShufflePressed: nil,
            onPlayPressed: nil
          )
          .padding(.horizontal, 16)

          ForEach(products) { product in
            SongRowCell(
              imageSize: 65,
              imageName: product.firstImage,
              title: product.title,
              subtitle: product.brand,
              onCellPressed: {},
              onEllipsisPressed: {}
            )
          }
          .padding(.leading, 16)

        }
      }
      .scrollIndicators(.hidden)
    }
    .task {
      await getData()
    }
    .toolbar(.hidden, for: .navigationBar)
  }

  private func getData() async {
    do {
      products = try await DatabaseHelper().getProducts()
    } catch {}
  }
}

#Preview {
  SpotifyPlaylistView()
}
