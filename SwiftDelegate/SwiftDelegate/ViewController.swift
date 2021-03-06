//
//  ViewController.swift
//  SwiftDelegate
//
//  Created by wangzhifei on 2017/1/13.
//  Copyright © 2017年 wangzhifei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let URL = "http://apis.haoservice.com/lifeservice/cook/query?"
    let loginName = "loginName"
    let exitName = "exitName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.accessToServerForGetLogin()
    }

    func accessToServerForGetLogin(){
        
        
        let parameters:NSDictionary = [
            "menu": "土豆",
            "pn":  1,
            "rn": "10",
            "key": "2ba215a3f83b4b898d0f6fdca4e16c7c",
            ]
        
        
//        MARK: 闭包回调请求
        NetWorkRequest.requestData(.post, URLString: URL, nameString: loginName, parameters: parameters as NSDictionary) { (result) in
            DLog(result)
        }
        //MARK: 代理请求
        NetWorkRequest.netWorkRequestData(.post, URLString: URL, nameString: loginName, parameters: parameters, responseDelegate: self)
    
        
    }
    //MARK:实现网络请求协议中的方法
    internal func netWorkRequestSuccess(data:AnyObject,requestName:String,parameters:NSDictionary,statusCode:Int){
        if requestName == loginName{
            DLog("\(data):(\(requestName):(\(parameters):(\(statusCode))")
        }else if (requestName == exitName){
            
        }
        
    }
    
    internal func netWorkRequestFailed(data:AnyObject,requestName:String,parameters:NSDictionary,statusCode:Int){
        DLog("\(data):(\(requestName):(\(parameters):(\(statusCode))")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

