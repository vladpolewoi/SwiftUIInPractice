//
//  ImageTitleRowCell.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 14.04.2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
  var imageSize: CGFloat = 100
  var imageName: String = Constants.randomImage
  var title: String = "Some title"

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      ImageLoaderView(urlString: imageName)
        .frame(width: imageSize, height: imageSize)
        .cornerRadius(8)

      Text(title)
        .font(.callout)
        .foregroundStyle(.spotifyLightGray)
        .lineLimit(2)
        .padding(4)
    }
    .frame(width: imageSize)
    
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    ImageTitleRowCell()
  }
}
