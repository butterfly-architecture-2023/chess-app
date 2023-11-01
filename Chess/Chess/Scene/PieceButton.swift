//
//  PieceButton.swift
//  Chess
//
//  Created by ByungHoon Ann on 2023/10/29.
//

import UIKit

final class PieceButton: UIButton {
    var chessPiece: ChessPiece {
        didSet {
            basicSet()
        }
    }
    
    init(frame: CGRect = .zero, chessPiece: ChessPiece) {
        self.chessPiece = chessPiece
        super.init(frame: frame)
        basicSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func basicSet() {
        backgroundColor = .brown
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        titleLabel?.font = .boldSystemFont(ofSize: 15)
        setTitle(chessPiece.pieceType.pieceCode(colorType: chessPiece.pieceColor), for: .normal)
        setTitleColor(chessPiece.pieceColor.color, for: .normal)
    }
    
    func selectButtonSet() {
        layer.borderColor = UIColor.systemPink.cgColor
        layer.borderWidth = 3
    }
    
    func canMoveButtonSet() {
        backgroundColor = .systemBlue
    }
}
