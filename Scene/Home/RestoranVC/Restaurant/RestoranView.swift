//
//  RestoView.swift
//  Uzum Tezkor App
//
//  Created by islombek on 24/01/24.
//

import UIKit

final class RestoView: UIView {

    private let refreshControl = UIRefreshControl()
    private let tableView = UITableView()
    
    private var currentSectionIndex = 0
    private var timer: Timer?
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 93, width: UIScreen.main.bounds.width, height: frame.size.height),
            collectionViewLayout: createLayout()
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(RecomendationCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView.register(CategoryCell3.self, forCellWithReuseIdentifier: "cell3")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerView")
        collectionView.register(HeaderView2.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerView2")
        collectionView.register(HeaderView3.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerView3")
        collectionView.backgroundColor = .white
   
        return collectionView
    }()
    
    init() {
        
        super.init(frame: .zero)
   
        setupCollectionView()
        setupRefreshControl()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        
    }
    
    private func setupRefreshControl() {
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc private func refreshData() {
        performDataRefresh { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func performDataRefresh(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
}
func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (
        sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection? in
        let section: NSCollectionLayoutSection
        
        if sectionIndex == SectionType.category.rawValue {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(145))
            
            let group: NSCollectionLayoutGroup =
            NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = .init(top: 23, leading: 10, bottom: 18, trailing: 10)
            section.accessibilityFrame = .zero
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(50))
            let sectionHearder = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [sectionHearder]
            return section
                   
        } else if sectionIndex == SectionType.recomendation.rawValue {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.20),
                heightDimension: .estimated(125))
            
            let group: NSCollectionLayoutGroup =
            NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            
            section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 18, leading: 10, bottom: 30, trailing: 10)
            section.accessibilityFrame = .zero
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(50))
            let sectionHearder = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [sectionHearder]
            
            return section
        } else {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.91),
                heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 10)

            let groupSize = NSCollectionLayoutSize(
                                widthDimension: .absolute(200),
                                heightDimension: .absolute(240))
                            
                            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                            
                            
                            section = NSCollectionLayoutSection(group: group)
                            section.interGroupSpacing = 10
                            section.contentInsets = NSDirectionalEdgeInsets(
                                top: 5,
                                leading: 10,
                                bottom: 10,
                                trailing: 10)
                            section.accessibilityFrame = .zero
                            
                            let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(50))
                            let sectionHearder = NSCollectionLayoutBoundarySupplementaryItem(
                                layoutSize: headerSize,
                                elementKind: UICollectionView.elementKindSectionHeader,
                                alignment: .top
                            )
                            section.boundarySupplementaryItems = [sectionHearder]
                          
                            return section
                }
        }
    return layout
}
