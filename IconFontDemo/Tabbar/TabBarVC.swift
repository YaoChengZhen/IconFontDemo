//
//  TabBarVC.swift
//  IconFontDemo
//
//  Created by bruceyao on 2020/6/18.
//  Copyright © 2020 bruce yao. All rights reserved.
//

import UIKit

class MainTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createItemByVC(childVC: HomeVC.init(), title: "首页", iconFont: Iconfont.TabHome)
        createItemByVC(childVC: SearchVC.init(), title: "分类", iconFont: Iconfont.TabSearch)
        createItemByVC(childVC: CartVC.init(), title: "消息", iconFont: Iconfont.TabCart)
        createItemByVC(childVC: MineVC.init(), title: "我的", iconFont: Iconfont.TabMine)

    }

//    MARK: 字体的方式生成图标
    private func createItemByVC(childVC: UIViewController, title: String, iconFont: Iconfont) -> Void {
        if !title.elementsEqual("") {
            childVC.title = title
        }else {
            childVC.title = nil
            childVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0);
        }
        // 适配iOS13导致的bug
        if #available(iOS 13, *) {
            tabBar.tintColor = .purple
            let item = UITabBarItem.appearance()
//            item.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -2);
            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .selected)

            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)], for: .normal)
            tabBar.unselectedItemTintColor = .black
        }else {
            childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
            
            childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)
        }
        
//        if (@available(iOS 13.0, *)) {
//            // iOS 13以上
//            self.tabBar.tintColor = RGB_HEX(0xfb5400);
//            self.tabBar.unselectedItemTintColor = RGB_HEX(0x999999);
//            UITabBarItem *item = [UITabBarItem appearance];
//            item.titlePositionAdjustment = UIOffsetMake(0, -2);
//            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
//            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
//        } else {
//            // iOS 13以下
//            UITabBarItem *item = [UITabBarItem appearance];
//            item.titlePositionAdjustment = UIOffsetMake(0, -2);
//            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:RGB_HEX(0x999999)} forState:UIControlStateNormal];
//            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:RGB_HEX(0xfb5400)} forState:UIControlStateSelected];
//        }
    
        
        childVC.view.backgroundColor = .white
        childVC.tabBarItem.image = UIImage.icon(from: iconFont, iconColor: UIColor.black, imageSize: CGSize.init(width: 30, height: 30), ofSize: 25).withRenderingMode(.alwaysOriginal)
        
        childVC.tabBarItem.selectedImage =  UIImage.icon(from: iconFont, iconColor: UIColor.purple, imageSize: CGSize.init(width: 30, height: 30), ofSize: 25).withRenderingMode(.alwaysOriginal)
        let baseNav = UINavigationController.init(rootViewController: childVC)
        childVC.navigationController?.navigationBar.isTranslucent = true
        self.addChild(baseNav)
    }

}
