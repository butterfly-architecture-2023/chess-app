//
//  Dictionary+Subscript.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

extension Dictionary {
    static func +=(lhs: inout Self, rhs: Self) {
        
        for (key, value) in rhs {
            lhs[key] = value
        }

    }
}
