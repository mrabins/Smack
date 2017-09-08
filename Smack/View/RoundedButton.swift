//
//  RoundedButton.swift
//  Smack
//
//  Created by Mark Rabins on 9/8/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

  
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
}
