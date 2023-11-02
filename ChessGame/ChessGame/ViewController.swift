//
//  ViewController.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/14.
//

import UIKit

enum Section {
    case main
}

enum Item: Hashable {
    case tile(row: Int, column: Int)
}

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let rows = Position.rankMap.count
    let columns = Position.fileMap.count
    let tileSize: CGFloat = 44.0
    
    private var board = Board()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.gameStart()
        
        collectionView.backgroundColor = .yellow
        configureCollectionView()
        configureDataSource()
        applyInitialSnapshot()
    }
    
    private func configureCollectionView() {
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(PieceCollectionViewCell.self, forCellWithReuseIdentifier: "PieceCollectionViewCell")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/CGFloat(columns)),
                                              heightDimension: .fractionalWidth(1.0/CGFloat(columns)))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(1.0/CGFloat(columns)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: columns)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = .zero
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PieceCollectionViewCell", for: indexPath) as! PieceCollectionViewCell
            
            switch item {
            case .tile(let row, let column):
                let piece = self.board.square[row][column]
                cell.configure(with: piece)
                
                cell.backgroundColor = (row + column) % 2 == 0 ? .white : .lightGray
                cell.pieceLabel.text = "\(self.board.display()[row][column])"
            }
            
            return cell
        }
    }
    
    private func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        
        var items = [Item]()
        for row in 0..<rows {
            for column in 0..<columns {
                items.append(.tile(row: row, column: column))
            }
        }
        snapshot.appendItems(items, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    // 입력 : select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deselectAllItems(in: collectionView)
        
        defer { collectionView.deselectItem(at: indexPath, animated: true) }
        
        let columns = Position.fileMap.count
        let actualRow = indexPath.item / columns
        let actualColumn = indexPath.item % columns
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? PieceCollectionViewCell else {
            return
        }
        
        // 출력 : 체스말이 이동할 수 있는 영역 selected 상태로 변경(UI 변경)
        let item = board.square[actualRow][actualColumn]
        
        if let position = Position(file: actualColumn, rank: actualRow),
           let positions = cell.piece?.movablePositions(current: position) {
            
            for pos in positions {
                let index = IndexPath(item: (pos.rank * columns) + pos.file, section: 0)
                if let cell = collectionView.cellForItem(at: index) as? PieceCollectionViewCell {
                    collectionView.selectItem(at: index, animated: false, scrollPosition: .centeredHorizontally)
                }
            }
        }
    }
    
    private func deselectAllItems(in collectionView: UICollectionView) {
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            for indexPath in selectedIndexPaths {
                collectionView.deselectItem(at: indexPath, animated: false)
            }
        }
    }
}
