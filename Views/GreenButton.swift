//
//  GreenButton.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit

class GreenButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    func configureButton(){
        backgroundColor = UIColor.init(red: 1/255, green: 200/255, blue: 1/255, alpha: 0.8)
        layer.cornerRadius = 8.0
        setTitleColor(.white , for: .normal)
        UIFont.boldSystemFont(ofSize: 16.0)

    }

}

