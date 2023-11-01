//
//  ErrorPresenterView.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/30.
//

import SwiftUI

struct ErrorPresenterView: View {
  @Binding var localError: Error?
  var body: some View {
    ZStack {
      switch localError.self {
      case is InputError:
        Text("InputError occured")
      case is MoveError:
        Text("MoveError occured")
      default:
        EmptyView()
      }
    }
    .font(.footnote)
    .frame(maxWidth: .infinity)
    .padding(.horizontal)
  }
}

#Preview {
  ErrorPresenterView(localError: .constant(InputError.formatError))
}
