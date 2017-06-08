//
//  FTCameraOverlayView.swift
//  FaceTube
//
//  Created by 龙鹏飞 on 2017/4/19.
//  Copyright © 2017年 https://github.com/LongPF/FaceTube. All rights reserved.
//

import UIKit
import SnapKit

protocol FTCameraOverlayViewProtocol {
    
}

class FTCameraOverlayView: FTView {

    var toolbar: FTVideoCaptureToolBar!
    var captureButton: FTCaptureButton!
    fileprivate weak var camera: FTCamera!
    
    //MARK: ************************  life cycle  ************************
    
    init(camera: FTCamera){
        super.init(frame: CGRect.init())
        self.camera = camera
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize();
    }
    
    fileprivate func initialize(){
        
        self.toolbar = FTVideoCaptureToolBar()
        self.addSubview(self.toolbar)
        
        self.captureButton = FTCaptureButton.init(model: FTCaptureButtonMode.FTCaptureButtonModeVideo)
        self.captureButton.addTarget(self, action: #selector(FTCameraOverlayView.captureButtonClicked(button:)), for: .touchUpInside)
        
        self.addSubview(self.captureButton)
        
        self.toolbar.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(40)
        }
        
        self.captureButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
            make.size.equalTo(CGSize.init(width: 68, height: 68))
        }
        
    }

    //MARK: ************************  response methods  ***************
    
    func captureButtonClicked(button: UIButton){
        
        if self.camera.recording {
            self.camera.stopRecording()
        }else{
            self.camera.startRecording()
        }
        
        button.isSelected = !button.isSelected
    }
    
    
}