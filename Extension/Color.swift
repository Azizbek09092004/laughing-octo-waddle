//
//  Color.swift
//  Uzum Tezkor App
//
//  Created by islombek on 24/01/24.
//

import UIKit

extension UIColor {
    
    static let appColor = AppColor()
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    struct AppColor {
        let upText: UIColor = .rgb(r: 255, g: 161, b: 172)
        let houseIcon: UIColor = .red
        let searchbarTf: UIColor = .gray
        let searchbarTint: UIColor = .rgb(r: 255, g: 161, b: 172)
        
        
        
        
    }
}
