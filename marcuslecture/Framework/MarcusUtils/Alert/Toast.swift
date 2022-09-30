//
//  Toast.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/30.
//

import UIKit


extension MarcusUtils {
    
    public class Toast {
    
        public struct BannerColors {
            public static let red = UIColor(red:198.0/255.0, green:26.00/255.0, blue:27.0/255.0, alpha:1.000)
            public static let green = UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000)
            public static let yellow = UIColor(red:255.0/255.0, green:204.0/255.0, blue:51.0/255.0, alpha:1.000)
            public static let blue = UIColor(red:31.0/255.0, green:136.0/255.0, blue:255.0/255.0, alpha:1.000)
        }
        
        public static func show(message: String, title: String = "", color : UIColor = BannerColors.green, dulation:Double=3.0) {
            
            let banner = Banner(title:title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: color)
            banner.dismissesOnTap = true
            banner.show(duration: dulation)
        }
    }
    
}
