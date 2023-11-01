//
//  SimpleLine.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/31.
//

import SwiftUI

struct SimpleLine: View {
  var body: some View {
    Rectangle()
      .fill(Color.gray.opacity(0.5))
      .frame(height:1)
  }
}

#Preview {
  SimpleLine()
}
