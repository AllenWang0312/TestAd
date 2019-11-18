//
//  FourthViewController.swift
//  TestAd
//
//  Created by Hs on 2019/11/7.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return self.loginV.style
    }
    private lazy var grayView:UIView = {
        let gray = UIView.init(frame: self.view.bounds)
        gray.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//        gray.isUserInteractionEnabled=false
        gray.alpha=0.0
        return gray
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(button)
        view.addSubview(grayView)
        view.addSubview(loginV)
    }
    
    private lazy var button:UIButton = {
        let btn = UIButton.init(type: .roundedRect)
        btn.frame = CGRect(x:10,y:300,width: kScreenW-20,height:100)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc private func btnClick(){
//        createHidden(value: 1)
//        loginV.show()
//        setNeedsStatusBarAppearanceUpdate()
        //        self.perform(#selector(downMove),with:nil,afterDelay: 0.5)
    }

    private lazy var loginV: DragDialogView = {
        let logV = DragDialogView.init(frame: CGRect(x:0,y: kScreenH, width: kScreenW, height: kScreenH))
        //        logV.layer.masksToBounds = true
        logV.background = self.grayView
        return logV
    }()
    
    
    
    private func createHidden(value:NSInteger){
        if value == 1{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.tabBarController?.tabBar.isHidden=true
        }else{
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.perform(#selector(hidTabbar),with: nil,afterDelay: 0.25)
        }
    }
    @objc private func hidTabbar(){
        self.tabBarController?.tabBar.isHidden=true
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
