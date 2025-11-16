//
//  TabBarController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - Properties
    
    enum Tab: Int, CaseIterable {
        case home = 0
        case forYou
        case search
        case drawer
        case shortCut
        
        var imageName: UIImage {
            switch self {
            case .home: return .btnHomeDefault
            case .forYou: return .btnForyouDefault
            case .search: return .btnSearch
            case .drawer: return .btnDrawer
            case .shortCut: return .btnShortcut
            }
        }
        
        var selectedImageName: UIImage {
            switch self {
            case .home: return .btnHomeSelected
            case .forYou: return .btnForyouSelected
            case .search: return .btnSearch
            case .drawer: return .btnDrawer
            case .shortCut: return .btnShortcut
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .home:
                return ViewController()
            case .forYou:
                return ViewController()
            case .search:
                return UIViewController()
            case .drawer:
                return UIViewController()
            case .shortCut:
                return UIViewController()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setViewControllers()
        setTabBarAppearance()
    }
    
    //MARK: - Private Methods
    
    private func setViewControllers() {
        self.viewControllers = Tab.allCases.map { tab in
            let vc = tab.viewController
            
            let icon = resizeImage(image: tab.imageName).withRenderingMode(.alwaysOriginal)
            let selectedIcon = resizeImage(image: tab.selectedImageName).withRenderingMode(.alwaysOriginal)
            
            let tabBarItem = UITabBarItem(title: nil, image: icon, selectedImage: selectedIcon)
            tabBarItem.tag = tab.rawValue
            vc.tabBarItem = tabBarItem
            return vc
        }
    }
    
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .background
        appearance.shadowColor = .gray600
        
        let itemAppearance = UITabBarItemAppearance()
        
        appearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
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
}

//MARK: - Extensions

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        
        switch Tab(rawValue: index) {
        case .home, .forYou: return true
        case .search, .drawer, .shortCut: return false
        case .none: return true
        }
    }
}


