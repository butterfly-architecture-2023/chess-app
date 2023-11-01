//
//  PieceCollectionViewCell.swift
//  ChessApp
//
//  Created by elly on 11/2/23.
//

import UIKit

class PieceCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Cell Identifier
    
    static let cellIdentifier: String = "piece_collectionview_cell"
    
    
    // MARK: - UI Items
    
    var button: UIButton = UIButton().then {
        $0.setTitle(".", for: .normal)
        $0.tintColor = UIColor.black
    }
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UISubviewStyle

extension PieceCollectionViewCell: UISubviewStyle {
    func addSubviews() {
        self.addSubview(button)
    }
    
    func makeConstraints() {
        button.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
