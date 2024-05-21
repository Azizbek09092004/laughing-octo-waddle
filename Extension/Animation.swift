//
//  Animation.swift
//  Uzum Tezkor App
//
//  Created by islombek on 24/01/24.
//

import UIKit

extension RestoranViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        UIView.animate(withDuration: 0.2) {
            cell.alpha = 1
            cell.transform = CGAffineTransform.identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {

        view.alpha = 0
        view.transform = CGAffineTransform(translationX: 0, y: -100)

        UIView.animate(withDuration: 0.5) {
            view.alpha = 1
            view.transform = CGAffineTransform.identity
        }
    }
}






