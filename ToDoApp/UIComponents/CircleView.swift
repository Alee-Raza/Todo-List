//
//  CircleView.swift
//  ToDoApp
//
//  Created by Ali Raza on 11/07/2024.
//

import Foundation

import UIKit
class CircleView: UIView {
    
    init(backgroundColor: UIColor, cornerRadius: CGFloat , clipsToBound: Bool ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
