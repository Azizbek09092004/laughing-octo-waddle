//
//  RestoranPresenter.swift
//  Uzum Tezkor App
//
//  Created by islombek on 24/01/24.
//

import UIKit

protocol RestoranPresenterable: AnyObject {
    func cellForItem(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func numberOfItems(in section: Int) -> Int
}

 class RestoranPresenter: RestoranPresenterable {
    
    var model = MainModel(
        category: [
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco"),
            RestaurantCategory(imageName: "reco")
        ],
        recomendation: [
            RestaurantRecomendation(imageName: "aylaa1", title: "30 minut"),
            RestaurantRecomendation(imageName: "aylaa2", title: "Aksiya"),
            RestaurantRecomendation(imageName: "aylaa3", title: "yangilik"),
            RestaurantRecomendation(imageName: "aylaa4", title: "magazin"),
            RestaurantRecomendation(imageName: "aylaa5", title: "burger"),
            RestaurantRecomendation(imageName: "aylaa6", title: "lavash"),
            RestaurantRecomendation(imageName: "aylaa7", title: "tovuq"),
            RestaurantRecomendation(imageName: "aylaa8", title: "obed"),
            RestaurantRecomendation(imageName: "aylaa9", title: "koproq"),
        ],
        restaurants: [
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
            RestaurantModel(image: "sec", title: "Lavash * Burger * Tovuq * Aksiya"),
        ])
    
    func numberOfItems(in section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .category:
            return model.category.count
        case .recomendation:
            return model.recomendation.count
        case .restourants:
            return model.restaurants.count
        }
    }
    
    func cellForItem(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell  {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
            
        case .category:
            if indexPath.row < 9 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCell
                cell.prepare(category: model.category[indexPath.row], indexPath: indexPath)
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath) as! CategoryCell
                cell.stopImageAnimation()
                return cell
            }
        case .recomendation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! RecomendationCell
            cell.prepare(model: model.recomendation[indexPath.row])
            return cell // Add this line to return the configured cell
        case .restourants:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! CategoryCell3
            
            cell.imageView3.backgroundColor = .white
            let imageName = "sec" + (indexPath.row + 1).description
            cell.imageView3.image = UIImage(named: imageName)
            
            let labels = ["Max Way", "Evos", "Oqtepa Lavash", "Bon!", "KFC", "Yaponamama", "Les Ailes", "Makro", "Espresso Yourself", "Hotdoggers", "Pokiza food", "Asia Somsa Centre", "Bus Sandwiches", "China Shashlik", "Iskandar Kabob", "Mazzali", "Osh Markazi", "Ploff Kebab", "Burger Embassy",]
            cell.titleLabel3.text = indexPath.row < labels.count ? labels[indexPath.row] : "Unknown Label"
            
            let labelss = ["Lavash * Burger * Tovuq * Aksiya",
                           "Burger * Lavash",
                           "Lavash * Burger * Tovuq * Aksiya",
                           "Yevropa * cofe * Desert",
                           "Brger * Lavash * Desert * Tovuq",
                           "Sushi * Azia",
                           "Lavash * Burger * Tovuq",
                           "Magazin * Aksiyalar",
                           "Desert * Cofe",
                           "Yevropa * Burger * Aksiya",
                           "Burger * Nonushta",
                           "Milliy Taom",
                           "Yevropa * Desert",
                           "Azia","Turk * Burger",
                           "Yevropa * Nonushta * Tushlik",
                           "Osh * Milliy taom",
                           " Milliy taom * Osh",
                           "Burger * Tovuq * Aksiya",]
    cell.labelmini.text = indexPath.row < labelss.count ? labelss[indexPath.row] : "Unknown Label"
            return cell
        }
    }
}
