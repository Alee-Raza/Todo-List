//
//  Button.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit

class Button: UIButton{
    
    var didTappedContinue : (() -> Void)?

    init(image : UIImage?, backgroundColor: UIColor, cornerRadius : CGFloat, title: String, font: CGFloat, color: UIColor, tintColor: UIColor ){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(image, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: font)
        self.setTitleColor(color, for: .normal)
        self.tintColor = tintColor
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonTapped(){
        didTappedContinue?()
    }
}
