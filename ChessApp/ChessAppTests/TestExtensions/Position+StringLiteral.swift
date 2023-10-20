//
//  Position+StringLiteral.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/15.
//

@testable import ChessApp

extension Position: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)!
    }
}
