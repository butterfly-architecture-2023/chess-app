//
//  PieceInfo.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/23.
//
import UIKit

enum PieceColor {
    case none
    case black
    case white
    
    var color: UIColor {
        switch self {
        case .none:
            return .clear
        case .black:
            return .black
        case .white:
            return .white
        }
    }
}

enum PieceType {
    case pawn
    case rook
    case bishop
    case knight
    case queen
    case king
    case none
    
    var score: Int {
        switch self {
        case .pawn:
            return 1
        case .rook:
            return 5
        case .bishop:
            return 3
        case .knight:
            return 3
        case .king:
            return 99
        case .queen:
            return 9
        case .none:
            return 0
        }
    }
    
    func pieceCode(colorType: PieceColor) -> String {
        switch self {
        case .pawn:
            return colorType == .black ? ChessPieceSymbols.blackPawn : ChessPieceSymbols.whitePawn
        case .rook:
            return colorType == .black ? ChessPieceSymbols.blackRook : ChessPieceSymbols.whiteRook
        case .bishop:
            return colorType == .black ? ChessPieceSymbols.blackBishop : ChessPieceSymbols.whiteBishop
        case .knight:
            return colorType == .black ? ChessPieceSymbols.blackKnight : ChessPieceSymbols.whiteKnight
        case .king  :
            return colorType == .black ? ChessPieceSymbols.blackKing : ChessPieceSymbols.whiteKing
        case .queen:
            return colorType == .black ? ChessPieceSymbols.blackQueen : ChessPieceSymbols.whiteQueen
        case .none:
            return "."
        }
    }
}
