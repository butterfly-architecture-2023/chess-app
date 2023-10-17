import Foundation

class Board {
  init() {}

  typealias Squares = [Int: [String: Piece?]]

  var squares: Squares = [:]

  func initialSquares() -> Squares {
    var result: [Int: [String: Piece?]] = [:]

    Array(0...7).forEach { rank in
      Array(0...7).forEach { index in
        result[rank + 1]?[String(format: "%c", index + 65)] = {
          guard rank == 1 || rank == 6 else {
            return nil
          }
          return Piece(pieceType: .pawn, colorType: rank == 1 ? .black : .white)
        }()
      }
    }

    return result
  }
}
