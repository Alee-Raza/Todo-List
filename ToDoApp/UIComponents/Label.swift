//
//  Label.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit

class Label: UILabel {
    init(text: String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment, cornerRaduis: CGFloat = 0.0 , backgroundColor: UIColor = .clear, numberOfLines: Int = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.layer.cornerRadius = cornerRaduis
        self.backgroundColor = backgroundColor
//        self.clipsToBounds =  true
        self.numberOfLines = numberOfLines
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
