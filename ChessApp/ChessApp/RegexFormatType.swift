//
//  File.swift
//  ChessApp
//
//  Created by elly on 11/2/23.
//

import Foundation

enum RegexFormatType: String {
    case updatePiece = "([A-H]{1}[0-8]{1})->([A-H]{1}[0-8]{1})"
    case help = "\\?([A-H]{1}[0-8]{1})"
    
    var pattern: String {
        return self.rawValue
    }
}
