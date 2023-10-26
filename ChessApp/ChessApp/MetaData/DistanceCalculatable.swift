//
//  DistanceCalculatable.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

protocol DistanceCalculatable {
    associatedtype Item
    
    func distance(with compared: Item) -> Int
}
