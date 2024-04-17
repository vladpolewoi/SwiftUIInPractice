//
//  SpotifyPlaylistView.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 15.04.2024.
//

import SwiftfulUI
import SwiftUI

struct SpotifyPlaylistView: View {
  var product: Product = .mock
  var user: User = .mock

  @State private var products: [Product] = []
  @State private var showHeader: Bool = true

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
          .readingFrame { frame in
            showHeader = frame.maxY < 160
          }

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

      ZStack {
        Text(product.title)
          .font(.headline)
          .foregroundStyle(.spotifyWhite)
          .padding(.vertical, 20)
          .frame(maxWidth: .infinity)
          .background(Color.spotifyBlack)
          .offset(y: showHeader ? 0 : -40)
          .opacity(showHeader ? 1 : 0)

        Image(systemName: "chevron.left")
          .font(.title3)
          .padding(10)
          .background(
            showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7)
          )
          .clipShape(
            Circle()
          )
          .onTapGesture {}
          .padding(.leading, 16)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundStyle(.spotifyWhite)
      .animation(.smooth(duration: 0.2), value: showHeader)

      .frame(maxHeight: .infinity, alignment: .top)
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
