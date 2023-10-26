//
//  Rook.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Rook: Piece {
    let score: Int = 5
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♜"
        case .white:
            return "♖"
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
            return [Position(file: .A, rank: .one), Position(file: .H, rank: .one)]
        case .white:
            return [Position(file: .A, rank: .eight), Position(file: .H, rank: .eight)]
        }
    }
    
    enum Direction {
        case up
        case down
        case left
        case right
        
        init?(from source: Position, to destination: Position) {
            let distanceOfFile = source.file.distance(with: destination.file)
            let distanceOfRank = source.rank.distance(with: destination.rank)
            
            if (source.file == destination.file) && distanceOfRank > 0 {
                self = .up
                return
            }
            
            if (source.file == destination.file) && distanceOfRank < 0 {
                self = .down
                return
            }
            
            if (source.rank == destination.rank) && distanceOfFile < 0 {
                self = .left
                return
            }
            
            if (source.rank == destination.rank) && distanceOfFile > 0 {
                self = .right
                return
            }
            
            return nil
        }
        
        func isNotExistPieceInMiddle(from source: Position, to destination: Position, pieces originPieces: [Position : Piece]) -> Bool {
            let distanceOfDestination: Int = {
                switch self {
                case .up, .down:
                    return abs(source.rank.distance(with: destination.rank))
                case .left, .right:
                    return abs(source.file.distance(with: destination.file))
                }
            }()
            
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
            case .up:
                file = position.file
                rank = Rank.allCases[safe: rankIndexOfOrigin + distance]
            case .down:
                file = position.file
                rank = Rank.allCases[safe: rankIndexOfOrigin - distance]
            case .left:
                file = File.allCases[safe: fileIndexOfOrigin - distance]
                rank = position.rank
            case .right:
                file = File.allCases[safe: fileIndexOfOrigin + distance]
                rank = position.rank
            }
            
            guard let file, let rank else { return nil }
            return Position(file: file, rank: rank)
        }
    }
    
}
