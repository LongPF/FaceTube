//
//  FTUserView.swift
//  FaceTube
//
//  Created by 龙鹏飞 on 2017/3/13.
//  Copyright © 2017年 https://github.com/LongPF/FaceTube. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


class FTUserView: FTView {

    var avatar: UIImageView!
    
    
    //MARK: lift cycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialize();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize();
    }
    
    fileprivate func initialize(){
        
        self.avatar = UIImageView.init()
        self.avatar.layer.masksToBounds = true
        self.avatar.layer.cornerRadius = 4
        self.avatar.image = UIImage.init(named: "ft_default_user_icon")
        self.addSubview(self.avatar)
        
        self.avatar.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    
    //MARK: interface methods
    
    public func updateUserViewWithHomeLiveModel(model: FTHomeLiveModel){
        let url = URL(string: (model.creator?.portrait!)!)
        avatar.kf.setImage(with: url, placeholder: UIImage.init(named: "ft_default_user_icon"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    

}
