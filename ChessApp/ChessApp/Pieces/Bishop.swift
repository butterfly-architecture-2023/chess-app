//
//  Bishop.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Bishop: Piece {
    let score: Int = 3
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    func canMove(to destination: Position, pieces originPieces: [Position : Piece]) -> Bool {
        guard self.source != destination else {
            return false
        }
        
        guard let direction = Direction(from: source, to: destination) else  {
            return false
        }
        
        return direction.isNotExistPieceInMiddle(from: self.source,
                                                 to: destination,
                                                 pieces: originPieces)
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .C, rank: .one), Position(file: .F, rank: .one)]
        case .white:
            return [Position(file: .C, rank: .eight), Position(file: .F, rank: .eight)]
        }
    }
    
    enum Direction {
        case upAndLeft
        case upAndRight
        case downAndLeft
        case downAndRight
        
        init?(from source: Position, to destination: Position) {
            let distanceOfFile = source.file.distance(with: destination.file)
            let distanceOfRank = source.rank.distance(with: destination.rank)
            
            guard abs(distanceOfFile) == abs(distanceOfRank) else {
                return nil
            }
            
            if distanceOfFile < 0 && distanceOfRank > 0 {
                self = .upAndLeft
                return
            }
            
            if distanceOfFile > 0 && distanceOfRank > 0 {
                self = .upAndRight
                return
            }
            
            if distanceOfFile > 0 && distanceOfRank < 0 {
                self = .downAndLeft
                return
            }
            
            if distanceOfFile < 0 && distanceOfRank < 0 {
                self = .downAndRight
                return
            }
            
            return nil
        }
        
        func isNotExistPieceInMiddle(from source: Position, to destination: Position, pieces originPieces: [Position : Piece]) -> Bool {
            let distanceOfDestination = abs(source.file.distance(with: destination.file))
            for distance in 1 ..< distanceOfDestination {
                guard let middlePosition = self.makePosition(with: source, distance: distance) else {
                    continue
                }
                
                if originPieces[middlePosition] != nil {
                    return false
                }
            }
            
            return true
        }
        
        private func makePosition(with position: Position, distance: Int) -> Position? {
            guard let fileIndexOfOrigin = File.allCases.firstIndex(of: position.file),
                  let rankIndexOfOrigin = Rank.allCases.firstIndex(of: position.rank)
            else { return nil }
            
            let file: File?
            let rank: Rank?
            
            switch self {
            case .upAndLeft:
                file = File.allCases[safe: fileIndexOfOrigin - distance]
                rank = Rank.allCases[safe: rankIndexOfOrigin + distance]
            case .upAndRight:
                file = File.allCases[safe: fileIndexOfOrigin + distance]
                rank = Rank.allCases[safe: rankIndexOfOrigin + distance]
            case .downAndLeft:
                file = File.allCases[safe: fileIndexOfOrigin - distance]
                rank = Rank.allCases[safe: rankIndexOfOrigin - distance]
            case .downAndRight:
                file = File.allCases[safe: fileIndexOfOrigin + distance]
                rank = Rank.allCases[safe: rankIndexOfOrigin - distance]
            }
            
            guard let file, let rank else { return nil }
            return Position(file: file, rank: rank)
        }
    }
}
