//
//  Net.swift
//  TestAd
//
//  Created by Hs on 2019/11/7.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit
import Alamofire

private let instance = Net()
class Net: NSObject {
    class var getInstance:Net{
        return instance
    }
}

extension Net{
    
    func request(_ type : HTTPMethod, url : String,param : [String:Any]?,callback : @escaping(_ response : Any)->()){
        
        Alamofire.request(url, method: type, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON{
            (responseJson) in
            guard responseJson.result.value != nil else{
                print(responseJson.result.error)
                return
            }
            guard responseJson.result.isSuccess else{
                return
            }
            if let value = responseJson.result.value{
                callback(value)
            }
        }
    }
}
