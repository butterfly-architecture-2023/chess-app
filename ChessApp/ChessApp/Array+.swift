//
//  Array+.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

extension Array {
    
    subscript(safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
    
}
