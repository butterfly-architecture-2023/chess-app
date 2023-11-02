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
    
    let rows = 8
    let columns = 8
    let tileSize: CGFloat = 44.0  // 원하는 타일 크기로 조절
    
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
    
    func configureCollectionView() {
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(PieceCollectionViewCell.self, forCellWithReuseIdentifier: "PieceCollectionViewCell")
    }
    
    func createLayout() -> UICollectionViewLayout {
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
    
    func configureDataSource() {
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
    
    func applyInitialSnapshot() {
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
