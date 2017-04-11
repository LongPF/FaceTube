//
//  FTHTTPClient.swift
//  FaceTube
//
//  Created by 龙鹏飞 on 2017/3/2.
//  Copyright © 2017年 https://github.com/LongPF/FaceTube. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class FTHTTPClient: NSObject {
    
    
    static func getRequest(urlString : String, params :[String : String]?, success :@escaping (_ value: Any) -> Void, fail:@escaping (_ error : NSError?) -> Void)
    {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire
            .request(urlString, method: .get, parameters: params)
            .responseJSON{ (response) in
                
                switch response.result{
                    case .success(let value):
                        success(value)
                    case .failure(let error):
                        fail(error as NSError?)
                }    
        }
                
    }
    
    
    static func postRequest(urlString : String, params : [String : String]?, success :@escaping (_ json : AnyObject) -> Void, fail:@escaping(_ error : Any) -> Void)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire
            .request(urlString, method: .get, parameters: params)
            .responseJSON{ (response) in
                
                switch response.result{
                
                    case .success(let value):
                        success(value as? [String : AnyObject] as AnyObject)
                    case .failure(let error):
                        fail(error)
                }
        }
    }
}
