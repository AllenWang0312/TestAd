//
//  TabBarViewController.swift
//  TestAd
//
//  Created by Hs on 2019/11/7.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var indexFlag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addControllers()
    }
    
    
    private func addControllers(){  
        addChildControllers(FirstViewController(), title: "首页",image: "tab_home_n", selectImg: "tab_home_s")
        addChildControllers(SecondViewController(), title: "电影",image: "tab_movie_n", selectImg: "tab_movie_s")
        addChildControllers(ThirdViewController(), title: "演出",image: "tab_live_n", selectImg: "tab_live_s")
        addChildControllers(FourthViewController(), title: "我的",image: "tab_mine_n", selectImg: "tab_mine_s")
    }
    private func addChildControllers(_ childVC:UIViewController, title:String, image:String,selectImg:String){
        childVC.tabBarItem.title=title
        childVC.tabBarItem.image=UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : Color(0xdb639b)], for: .selected)
        
        let nav = UINavigationController()
        nav.addChild(childVC)
        addChild(nav)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item){
            if indexFlag != index {
                animationWithIndex(index: index)
            }
        }
    }
    private func animationWithIndex(index:Int){
//        var arrViews = [UIView]()
        
        
//        for tabbarButton in tabBar.subviews{
//            if tabbarButton .isKind(of: NSClassFromString("UITabBarButton")!){
//                arrViews.append(tabbarButton)
//            }
//        }
        let pulse = CABasicAnimation(keyPath: "transform.scale")//缩放动画
        pulse.timingFunction=CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)//动画函数
        pulse.duration = 0.2//执行时间
        pulse.repeatCount=1//执行次数
        pulse.autoreverses = true//执行完复位
        pulse.fromValue = NSNumber(value: 0.9)//
        pulse.toValue=NSNumber(value: 1.1)
//        arrViews[index].layer.add(pulse, forKey: nil)
        tabBar.subviews[index+1].layer.add(pulse, forKey: nil)
        
        indexFlag=index
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
