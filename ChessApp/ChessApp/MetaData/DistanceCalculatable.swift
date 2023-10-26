//
//  DistanceCalculatable.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

protocol DistanceCalculatable {
    associatedtype Item
    
    var amount: Int { get }
    func distance(with compared: Item) -> Int
}
