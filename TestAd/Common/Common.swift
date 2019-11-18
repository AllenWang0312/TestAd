//
//  Common.swift
//  TestAd
//
//  Created by Hs on 2019/11/7.
//  Copyright © 2019 swant. All rights reserved.
//
import UIKit

import Foundation

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let KeyWindow = UIApplication.shared.keyWindow
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiom.phone)

let kIsIphoneX=Bool(kScreenW > 375.0 && kScreenH >= 812.0 && kIsIphone)
let kNavigationBarH = CGFloat(kIsIphoneX ? 88:64)

let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

let kTabBarH = CGFloat(kIsIphoneX ? (49+34):49)

func RGBColor(r: Int,g: Int,b: Int)-> UIColor{
    return RGBColor(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
}
func RGBColor(r: CGFloat,g: CGFloat,b: CGFloat)-> UIColor{
    return UIColor.init(red: r/256.0, green: g/256.0, blue: b/256.0, alpha: 1)
}
func Color(_ c:Int)->UIColor{
    return RGBColor(r: (c>>16)&0xff, g: (c>>8)&0xff, b: c&0xff)
}

func customFont(font:CGFloat)-> UIFont{
    //刘海屏
    guard kScreenH <= 736 else{
        return UIFont.systemFont(ofSize: font)
    }
    //5.5
    guard kScreenH == 736 else {
        return UIFont.systemFont(ofSize: font-2)
    }
    //4.7
    guard kScreenW >= 736 else {
        return UIFont.systemFont(ofSize: font-4)
    }
    return UIFont.systemFont(ofSize: font)
    
}

//Alamofire.request(URLString,method:method,parameters:paramaters,encoding:URLEncoding.default , headers:nil).responseJSON{
//    (responseJson) in
//    guard responseJson.result.value!=nil else{
//        print(responseJson.result.error!)
//        return
//    }
//    guard responseJson.result.isSuccess else{
//        return
//    }
//
//}

