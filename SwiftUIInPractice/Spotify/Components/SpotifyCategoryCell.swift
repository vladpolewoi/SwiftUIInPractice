//
//  SpotifyCategoryCell.swift
//  SwiftUIInPractice
//
//  Created by Quest76 on 11.04.2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
  var title: String = "All"
  var isSelected: Bool = false

  var body: some View {
    Text(self.title)
      .font(.callout)
      .frame(minWidth: 35)
      .padding(.vertical, 8)
      .padding(.horizontal, 10)
      .themeColors(isSelected: isSelected)
      .cornerRadius(16)
  }
}

extension View {
  func themeColors(isSelected: Bool) -> some View {
    self
      .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
      .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    VStack(spacing: 40) {
      SpotifyCategoryCell(title: "Title Test")
      SpotifyCategoryCell(title: "Title Test", isSelected: true)
      SpotifyCategoryCell(isSelected: true)
    }
  }
}
