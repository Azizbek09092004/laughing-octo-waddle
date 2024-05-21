//
//  ViewController+.swift
//  Uzum Tezkor App
//
//  Created by islombek on 07/02/24.
//

import UIKit

extension UIViewController {
    
    func pushVC(with vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "backkk"), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15) // Adjust the size as needed
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 5, right: 330) // Add left padding
        
        backButton.addTarget(self, action: #selector(goBackVC), for: .touchUpInside)
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.setLeftBarButton(customBackButton, animated: true)
    }

    @objc private func goBackVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

//
//extension UIViewController {
//    
//   
//    
//    func pushbackVC(with vc: UIViewController) {
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//    
//    func setnavback() {
//        weak var navigationController: UINavigationController?
//        
//        let backButtonnav = UIButton(type: .system)
//        backButtonnav.setImage(UIImage(named: "backkk"), for: .normal)
//        backButtonnav.frame = CGRect(x: 0, y: 0, width: 15, height: 15) // Adjust the size as needed
//        backButtonnav.contentEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 5, right: 330)
//       
//        backButtonnav.setTitle("Back", for: .normal)
//        backButtonnav.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
//        
//        let customBackButton = UIBarButtonItem(customView: backButtonnav)
//        navigationItem.setLeftBarButton(customBackButton, animated: true)
//        
//    }
//    @objc func leftButtonTapped() {
//        navigationController?.popViewController(animated: true)
//    }
//}
