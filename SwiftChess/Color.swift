//
//  Color.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

enum PieceColor {
    case white, black
}

protocol Color {
    var color: PieceColor { get }
}
