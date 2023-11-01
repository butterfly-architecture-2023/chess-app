//
//  BoardView.swift
//  ChessApp
//
//  Created by elly on 11/1/23.
//

import UIKit
import SnapKit
import Then

/**
 BoardView -> Board 입력
 Board -> BoardView 출력
 */

class BoardView: UIView {
    
    // MARK: - UI Items
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: - Properties
    
    var chessPieceGroup: ChessPieceGroup!
    var listOfPieces: [Piece] = []
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCollectionView()
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBoard() {
        var board: Board = Board(size: 8)
        self.chessPieceGroup = board.display()
        
        self.listOfPieces = sortChessPieceGroup().compactMap { $0.value }
    }
    
    private func setCollectionView() {
        collectionView.register(PieceCollectionViewCell.self, forCellWithReuseIdentifier: PieceCollectionViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func sortChessPieceGroup() -> Array<(key: Position, value: any Piece)> {
        return chessPieceGroup.sorted {
            if $0.key.rank == $1.key.rank {
                return $0.key.file < $1.key.file
            }
            return $0.key.rank < $1.key.rank
        }
    }
}


// MARK: - UICollectionViewDataSource

extension BoardView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfPieces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PieceCollectionViewCell.cellIdentifier, for: indexPath) as? PieceCollectionViewCell else { return UICollectionViewCell() }
        let icon = listOfPieces[indexPath.row].showIcon()
        cell.button.setTitle(icon, for: .normal)
        cell.backgroundColor = .systemPink
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension BoardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width / 8) - 5
        let cellHeight = (collectionView.frame.size.width / 8) - 5
        return CGSize(width: cellWidth, height: CGFloat(cellHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


// MARK: - UISubviewStyle

extension BoardView: UISubviewStyle{
    func addSubviews() {
        self.addSubview(collectionView)
    }
    
    func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
