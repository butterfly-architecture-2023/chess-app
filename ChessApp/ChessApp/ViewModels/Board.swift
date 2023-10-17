import Foundation

class Board {
  init() {}

  typealias SquarePosition = (rank: Int, file: String)
  typealias Squares = [Int: [String: Piece?]]

  let blackPawn = String("\u{265F}")
  let whitePawn = String("\u{2659}")

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

  func display() -> [String] {
    Array(0...7).map { rankIndex in
      Array(0...7).reduce("") { result, fileIndex in
        let piece = getPiece(rankIndex: rankIndex, fileIndex: fileIndex)
        let pawn = piece.map { $0.colorType == .black ? blackPawn : whitePawn }
        var temp = result
        temp.append(pawn ?? ".")
        return temp
      }
    }
  }

  func movePiece(from startSquare: String, to endSquare: String) throws -> Squares {
    let start: SquarePosition = try getSquarePosition(from: startSquare)
    let end: SquarePosition = try getSquarePosition(from: endSquare)

    var temp = squares
    temp[end.rank]?[end.file] = squares[start.rank]?[start.file]
    temp[start.rank]?[start.file] = nil
    return temp
  }

  func getPiece(rankIndex: Int, fileIndex: Int) -> Piece? {
    guard
      let rank = squares[rankIndex + 1],
      let piece = rank[String(format: "%c", fileIndex + 65)]
    else {
      return nil
    }
    return piece
  }

  func getSquarePosition(from square: String) throws -> SquarePosition {
    guard
      let file = square.first.map(String.init),
      let stringifiedRank = square.last.map(String.init),
      let rank = Int(stringifiedRank)
    else {
      throw AppError.wrongSquareID
    }

    return (rank: rank, file: file)
  }
}
