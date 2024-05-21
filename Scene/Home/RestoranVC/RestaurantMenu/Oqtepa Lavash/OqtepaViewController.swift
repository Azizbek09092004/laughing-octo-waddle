//
//  OqtepaViewController.swift
//  Uzum Tezkor App
//
//  Created by islombek on 08/02/24.
//

import UIKit

final class OqtepaViewController: UIViewController {
    
    private var headerZoomed = false
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createLayout()
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OqtepaCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(OqtepaCell2.self, forCellWithReuseIdentifier: "cell2")
        collectionView.register(
            OqtepaHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .white
        setBackButton()

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -59).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            if sectionIndex == SectionType4.category.rawValue {
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(UIScreen.main.bounds.width ),
                    heightDimension: .estimated(280))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                
            } else {
             
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .fractionalHeight(1.7))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let item2 = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 20, leading: 10, bottom: 200, trailing: 10)
                item2.contentInsets = .init(top: 20, leading: 10, bottom: 200, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(350))
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item, item2])
                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(235))
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [header]
                return section
            }
            return section
        }
        return layout
    }
}

extension OqtepaViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType3.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == SectionType4.category.rawValue {
            return 1
        } else {
            return 8
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == SectionType4.category.rawValue {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath) as! OqtepaCell
            cell.navigationController = navigationController
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell2",
                for: indexPath) as! OqtepaCell2
            return cell
        }
    }
    
    func collectionView(_
                        collectionView: UICollectionView, viewForSupplementaryElementOfKind
                        kind: String, at
                        indexPath: IndexPath)
    -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "headerView",
                for: indexPath) as? OqtepaHeader
            else {
                return UICollectionReusableView()
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
}

enum SectionType4: Int, CaseIterable {
    case category = 0
    case recomendation = 1
}




