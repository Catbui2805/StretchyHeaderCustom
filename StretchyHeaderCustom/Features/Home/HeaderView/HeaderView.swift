//
//  HeaderView.swift
//  StretchyHeaderCustom
//
//  Created by Nguyen Tran Cong on 1/8/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {

    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "2"))
        iv.contentMode = UIImageView.ContentMode.scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // TODO: - custome code for layout
//        self.backgroundColor = .red
        
        self.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
