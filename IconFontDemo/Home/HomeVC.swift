//
//  HomeVC.swift
//  IconFontDemo
//
//  Created by bruceyao on 2020/6/18.
//  Copyright © 2020 bruce yao. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 100, y: 100), size: CGSize.init(width: 30, height: 30)))
        label.font = UIFont.iconfont(ofSize: 30)
        label.text = Iconfont.TabHome.rawValue
        label.textColor = UIColor.red
        view.addSubview(label)
        
        let label1 = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 100, y: 140), size: CGSize.init(width: 30, height: 30)))
        label1.font = UIFont.iconfont(ofSize: 30)
        label1.text = Iconfont.TabCart.rawValue
        view.addSubview(label1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
