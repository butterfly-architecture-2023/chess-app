//
//  BoardSquareView.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/11/01.
//

import UIKit

final class BoardSquareView: UIButton {
    
    // MARK: - ui component property
    
    private let pieceLabel: UILabel = .init()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
}

// MARK: - internal method

extension BoardSquareView {
    func update(symbol: String?) {
        pieceLabel.text = symbol
    }
    
    func hasBorderColor(_ has: Bool) {
        layer.borderColor = has ? UIColor.black.cgColor : UIColor.clear.cgColor
        layer.borderWidth = has ? 3 : 0
    }
}

// MARK: - set up UI

extension BoardSquareView {
    private func setUpUI() {
        setUpButton()
        setUpLayout()
        setUpComponents()
    }
    
    private func setUpButton() {
    }
    
    private func setUpLayout() {
        addSubview(pieceLabel)
        pieceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pieceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pieceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setUpComponents() {
        setUpPieceLabel()
    }
    
    private func setUpPieceLabel() {
        pieceLabel.font = .systemFont(ofSize: 30)
    }
    
}

// MARK: - preview

@available(iOS 17, *)
#Preview {
    let view = BoardSquareView(frame: .init(x: 0, y: 0, width: 50, height: 50))
    view.update(symbol: "♝")
    return view
}
