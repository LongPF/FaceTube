//
//  FTVideoCaptureToolBar.swift
//  FaceTube
//
//  Created by 龙鹏飞 on 2017/3/23.
//  Copyright © 2017年 https://github.com/LongPF/FaceTube. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol FTVideoCaptureToolBarDelegate: NSObjectProtocol {
    
    func videoCaptureToolBarClose()
    func videoCaptureToolBarBeauty()
    func videoCaptureToolBarFlash(on: Bool)
    func videoCaptureToolBarSwitch()
    
}

class FTVideoCaptureToolBar: FTView {

    var closeButton: UIButton!
    var beautyButton: UIButton!
    var flashButton: UIButton!
    var cameraSwitchButton: UIButton!
    var delegate: FTVideoCaptureToolBarDelegate?;
    
    //MAKR : life cycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialize();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize();
    }
    
    func initialize(){
        
        self.backgroundColor = UIColor.clear
        
        closeButton = UIButton()
        closeButton.setTitle("关闭", for: .normal)
        closeButton.addTarget(self, action: #selector(closeAction(button:)), for: .touchUpInside)
        self.addSubview(closeButton)
        
        beautyButton = UIButton()
        beautyButton.setTitle("美颜", for: .normal)
        beautyButton.addTarget(self, action: #selector(beautyAction(button:)), for: .touchUpInside)
        self.addSubview(beautyButton)
        
        flashButton = UIButton()
        flashButton.setTitle("闪关灯", for: .normal)
        flashButton.addTarget(self, action: #selector(flashAction(button:)), for: .touchUpInside)
        self.addSubview(flashButton)
        
        cameraSwitchButton = UIButton()
        cameraSwitchButton.setTitle("切换", for: .normal)
        cameraSwitchButton.addTarget(self, action: #selector(camerSwitchButton(button:)), for: .touchUpInside)
        self.addSubview(cameraSwitchButton)
        
        closeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(0)
            make.top.bottom.equalTo(self)
            make.width.equalTo(beautyButton.snp.width)
        }
        
        beautyButton.snp.makeConstraints { (make) in
            make.leading.equalTo(closeButton.snp.trailing)
            make.top.bottom.equalTo(self)
            make.width.equalTo(beautyButton.snp.width)
        }
        
        flashButton.snp.makeConstraints { (make) in
            make.leading.equalTo(beautyButton.snp.trailing)
            make.top.bottom.equalTo(self)
            make.width.equalTo(beautyButton.snp.width)
        }
        
        cameraSwitchButton.snp.makeConstraints { (make) in
            make.leading.equalTo(flashButton.snp.trailing)
            make.trailing.equalTo(self.snp.trailing)
            make.top.bottom.equalTo(self)
            make.width.equalTo(beautyButton.snp.width)
        }
        
    }
    
    
    //MARK: response mehtods
    
    func closeAction(button: UIButton){
        
        let sel: Selector! = NSSelectorFromString("videoCaptureToolBarClose")
        if (delegate != nil && (delegate?.responds(to: sel))!){
            delegate?.videoCaptureToolBarClose()
        }
        
    }
    
    func beautyAction(button: UIButton){
        
        let sel: Selector! = NSSelectorFromString("videoCaptureToolBarBeauty")
        if (delegate != nil && (delegate?.responds(to: sel))!){
            delegate?.videoCaptureToolBarBeauty()
        }
        
    }
    
    static var on = true
    
    func flashAction(button: UIButton){
        
        
        let sel = #selector(FTVideoCaptureToolBarDelegate.videoCaptureToolBarFlash(on:))
        if (delegate != nil && (delegate?.responds(to: sel))!){
            delegate?.videoCaptureToolBarFlash(on: FTVideoCaptureToolBar.on)
            FTVideoCaptureToolBar.on = !FTVideoCaptureToolBar.on
        }
        
    }
    
    
    func camerSwitchButton(button: UIButton){
        
        let sel: Selector! = NSSelectorFromString("videoCaptureToolBarSwitch")
        if (delegate != nil && (delegate?.responds(to: sel))!){
            delegate?.videoCaptureToolBarSwitch()
        }
        
    }
    
}
