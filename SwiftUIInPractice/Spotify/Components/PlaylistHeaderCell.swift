//
//  PlaylistHeaderCell.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 15.04.2024.
//

import SwiftfulUI
import SwiftUI

struct PlaylistHeaderCell: View {
  var height: CGFloat = 300
  var title: String = "Some playlist titlegoes here"
  var subtitle: String = "Subtitle"
  var imageName: String = Constants.randomImage
  var shadowColor: Color = .spotifyBlack.opacity(0.8)

  var body: some View {
    Rectangle()
      .opacity(0)
      .overlay(
        ImageLoaderView(urlString: imageName)
      )
      .overlay(
        VStack(alignment: .leading, spacing: 8) {
          Text(subtitle)
            .font(.headline)
          Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
        }
        .foregroundStyle(.spotifyWhite)
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
          LinearGradient(
            colors: [
              shadowColor.opacity(0),
              shadowColor
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        ),
        alignment: .bottomLeading
      )
      .asStretchyHeader(startingHeight: height)
      .frame(height: 300)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    ScrollView {
      PlaylistHeaderCell()
    }
    .ignoresSafeArea()
  }
}
