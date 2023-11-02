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
    var board: Board = Board(size: 8)
    var chessPieceGroup: ChessPieceGroup!
    var listOfPieces: [(key: Position, value: any Piece)] = []
    var inputBuffer: [Position] = []
    
    
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
        self.chessPieceGroup = board.display()
        self.listOfPieces = sortChessPieceGroup().compactMap { $0 }
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
        let icon = listOfPieces[indexPath.row].value.showIcon()
        cell.button.setTitle(icon, for: .normal)
        cell.backgroundColor = .systemPink
        cell.isUserInteractionEnabled = true
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension BoardView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let piece = listOfPieces[indexPath.row]
        print(piece.key.rank, piece.key.file, piece.value)
        
        // TODO: - 버튼 클릭 시, 이동 가능한 위치 보여주는 부분 구현중...
//        // 버퍼가 2가 넘어가면 지움
//        if inputBuffer.count > 1 {
//            inputBuffer.removeAll()
//        }
//        
//        // 버퍼에 추가
//        inputBuffer.append(Position(rank: piece.key.rank, file: piece.key.file))
//        debugPrint(inputBuffer)
        
        // 첫번째 클릭 시, 이동 가능 위치 출력
        if inputBuffer.count == 1 {
            do {
                try board.checkMovable(inputBuffer, .help)
            } catch let error {
                guard let error = error as? ErrorType else { return }
                print(error.showMessage())
            }
        }
        
        
        
        
        
        
        
//        try board.checkMovable(positionInfo, inputFormatType)
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
