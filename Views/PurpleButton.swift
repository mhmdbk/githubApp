//
//  PurpleButton.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/9/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit

class PurpleButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    func configureButton(){
        backgroundColor = UIColor.init(red: 106/255, green: 13/255, blue: 173/255, alpha: 0.9)
        layer.cornerRadius = 8.0
        setTitleColor(.white , for: .normal)
        UIFont.boldSystemFont(ofSize: 18.0)

    }

}
