//
//  BoardViewModel.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

struct BoardViewModel {
    let elements: [Position: Element]
    
    struct Element {
        let description: String
        let isSelected: Bool
        let isHighlighted: Bool
        let backgroundColor: UIColor
    }
}
