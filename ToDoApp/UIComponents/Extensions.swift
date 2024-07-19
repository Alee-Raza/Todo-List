//
//  Extensions.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import Foundation
import UIKit

extension UIButton {
    func enable(){
        self.alpha = 1
        self.isUserInteractionEnabled = true
    }
    func disable(){
        self.alpha = 0.3
        self.isUserInteractionEnabled = false
    }
}
