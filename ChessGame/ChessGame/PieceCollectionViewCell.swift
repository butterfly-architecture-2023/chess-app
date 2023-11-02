//
//  PieceCollectionViewCell.swift
//  ChessGame
//
//  Created by 오킹 on 2023/11/02.
//

import UIKit

class PieceCollectionViewCell: UICollectionViewCell {
    
    var pieceLabel: UILabel = {
        var view = UILabel()
        view.text = "."
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var piece: Piece? = nil
    
    override var isSelected: Bool {
         didSet {
             self.layer.borderWidth = isSelected ? 2.0 : 0.0
             self.layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.clear.cgColor
         }
     }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    private func configureUI() {
        addSubview(pieceLabel)
        
        NSLayoutConstraint.activate([
            pieceLabel.topAnchor.constraint(equalTo: topAnchor),
            pieceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            pieceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            pieceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(with piece: Piece?) {
        self.piece = piece
    }
}
