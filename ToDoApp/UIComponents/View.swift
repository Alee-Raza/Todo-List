//
//  View.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import Foundation

import UIKit
class View: UIView {
    
    init(backgroundColor: UIColor, cornerRadius: CGFloat , maskToBound: Bool = false) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
//        self.layer.masksToBounds = maskToBound
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
