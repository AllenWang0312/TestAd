//
//  LoginView.swift
//  TestAd
//
//  Created by Hs on 2019/11/8.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit

class DragDialogView: UIView {
    
    var style :UIStatusBarStyle = .default
    var loginViewOriginY: CGFloat = kStatusBarH
      var scrollAlpha :CGFloat = 1.0
    public var background:UIView?=nil
    
    //    public let getVeiw: UIView = {
    //        let line = UIView()
    //        line.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 100)
    //        line.backgroundColor = UIColor.orange
    //        line.isHidden  = false
    //        return line
    //    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor=UIColor.white
        self.layer.cornerRadius = 10
        let panView = UIPanGestureRecognizer.init(target: self, action:#selector( pan(panGuesture:)) )
        self.addGestureRecognizer(panView)
    }
  
    
    @objc func pan(panGuesture:UIPanGestureRecognizer){
        if(panGuesture.state == .began){
            
        }else if panGuesture.state == .changed{
            let y = panGuesture.translation(in: self).y
            if y <= kStatusBarH{
                self.frame = CGRect(x: 0, y: kStatusBarH, width: kScreenW, height: kScreenH)
            }else{
                self.frame = CGRect(x: 0, y: loginViewOriginY+y, width: kScreenW, height: kScreenH)
            }
            scrollAlpha = self.frame.origin.y/kScreenH/2.0
            if scrollAlpha > 0.5{
                scrollAlpha=0.5
            }
            self.background?.alpha = 1 - scrollAlpha
        }else if panGuesture.state == .ended{
            if self.frame.origin.y<=kScreenH/2{
                UIView.animate(withDuration: 0.25) {
                    self.frame = CGRect(x: 0, y: self.loginViewOriginY, width: kScreenW, height: kScreenH)
                    self.background?.alpha = 1.0
                }
            }else{
                UIView.animate(withDuration: 0.25) {
                    self.frame = CGRect(x: 0, y: kScreenH, width: kScreenW, height: kScreenH)
                    self.background?.alpha = 0.0
                }
            }
        }
        if(nil != self.background){
            if self.background!.alpha >= 0.5{
                    self.style = .lightContent
                    //               setNeedsStatusBarAppearanceUpdate()
                }else{
                    self.style = .default
                    //                setNeedsStatusBarAppearanceUpdate()
                }
        }
    }
    func show(){
        style = .lightContent
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: 0, y: kStatusBarH/2, width: kScreenW, height: kScreenH)
            self.alpha = 1.0
        }
        self.perform(#selector(downMove),with:nil,afterDelay: 0.5)
    }
    
    @objc private func downMove(){
        UIView.animate(withDuration: 0.2) {
            self.frame = CGRect(x: 0, y: kStatusBarH, width: kScreenW, height: kScreenH)
            self.background?.alpha = 1.0
        }
    }
}
