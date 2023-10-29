//
//  CGRect+center.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import Foundation

extension CGRect {
    var center: CGPoint {
        get {
            CGPoint(x: midX, y: midY)
        }
        set {
            origin.x = newValue.x - (width / 2)
            origin.y = newValue.y - (height / 2)
        }
    }
}
