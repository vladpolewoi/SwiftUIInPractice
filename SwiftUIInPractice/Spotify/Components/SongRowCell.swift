//
//  SongRowCell.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 17.04.2024.
//

import SwiftUI

struct SongRowCell: View {
  var imageSize: CGFloat = 50
  var imageName: String = Constants.randomImage
  var title: String = "Some song title"
  var subtitle: String? = "Some artists name"
  var onCellPressed: (() -> Void)? = nil
  var onEllipsisPressed: (() -> Void)? = nil

  var body: some View {
    HStack(spacing: 8) {
      ImageLoaderView(urlString: imageName)
        .frame(width: imageSize, height: imageSize)
        .cornerRadius(8)

      VStack(alignment: .leading, spacing: 4, content: {
        Text(title)
          .font(.body)
          .fontWeight(.medium)
          .foregroundStyle(.spotifyWhite)

        if let subtitle {
          Text(subtitle)
            .font(.callout)
            .foregroundStyle(.spotifyLightGray)
        }
      })
      .lineLimit(2)
      .frame(maxWidth: .infinity, alignment: .leading)

      Image(systemName: "ellipsis")
        .font(.subheadline)
        .foregroundStyle(.spotifyWhite)
        .padding(16)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
          onEllipsisPressed?()
        }
    }
    .background(Color.black.opacity(0.001))
    .onTapGesture {
      onCellPressed?()
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    VStack {
      SongRowCell()
      SongRowCell()
      SongRowCell()
      SongRowCell()
    }
  }
}
