//
//  TabBarController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        setTabBarAppearance()
    }
    
    private func setViewControllers() {
        
        let homeVC = ViewController()
        let forYouVC = ViewController()
        let searchVC = ViewController()
        let drawerVC = ViewController()
        let shortCutVC = ViewController()
        
        let homeIcon = resizeImage(image: .btnHomeDefault)
        let forYouIcon = resizeImage(image: .btnForyouDefault)
        let searchIcon = resizeImage(image: .btnSearch)
        let drawerIcon = resizeImage(image: .btnDrawer)
        let shortCutIcon = resizeImage(image: .btnShortcut)
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: homeIcon, tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: "ForYou", image: forYouIcon, tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: "탐색", image: searchIcon, tag: 2)
        drawerVC.tabBarItem = UITabBarItem(title: "음악서랍", image: drawerIcon, tag: 3)
        shortCutVC.tabBarItem = UITabBarItem(title: "바로가기", image: shortCutIcon, tag: 4)
        
        self.viewControllers = [homeVC, forYouVC, searchVC, drawerVC, shortCutVC]
    }
    
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .background
        appearance.shadowColor = .gray600
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .gray300
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.gray300,
            //            .font:
            
        ]
        
        itemAppearance.selected.iconColor = .primary
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.primary,
            //            .font:
        ]
        
        appearance.stackedLayoutAppearance = itemAppearance
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}

private func resizeImage(image: UIImage) -> UIImage {
    let targetSize = CGSize(width: 24, height: 24)
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    let ratio = min(widthRatio, heightRatio)
    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: CGRect(origin: .zero, size: newSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage ?? image
}


