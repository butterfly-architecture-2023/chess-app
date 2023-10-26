//
//  Position.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Position: Hashable, Equatable {
    let file: File
    let rank: Rank
}
