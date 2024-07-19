//
//  InputFields.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit
import Foundation

class TextField: UITextField {
    
    private let eyeButton = UIButton(type: .custom)
    private var isSecureEntry = true
    
    init(placeholder: String, borderStyle: UITextField.BorderStyle = .roundedRect, cornerRadius: CGFloat, backgroundColor: UIColor, borderColor: UIColor, isEyeButtonRequired: Bool = false) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = borderStyle
        self.placeholder = placeholder
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.cgColor
        
        if isEyeButtonRequired {
            setupEyeButton()
            setupRightView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton() {
        let image = UIImage(systemName: "eye")
        eyeButton.setImage(image, for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.contentMode = .scaleAspectFit
        eyeButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        eyeButton.addTarget(self, action: #selector(toggleSecureEntry), for: .touchUpInside)
    }
    
    private func setupRightView() {
        self.rightView = eyeButton
        self.rightViewMode = .always
        self.isSecureTextEntry = true
    }
    
    @objc private func toggleSecureEntry() {
        isSecureEntry.toggle()
        let imageName = isSecureEntry ? "eye.fill" : "eye.slash.fill"
        let image = UIImage(systemName: imageName)
        eyeButton.setImage(image, for: .normal)
        self.isSecureTextEntry = isSecureEntry
    }
    
}
