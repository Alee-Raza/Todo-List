//
//  DatePicker.swift
//  ToDoApp
//
//  Created by Ali Raza on 03/07/2024.
//

import UIKit

class DatePicker: UIDatePicker {
    
    var dateSelectedHandler: ((Date) -> Void)?

    init(mode: UIDatePicker.Mode, backgroundColor: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.datePickerMode = mode
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        self.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        dateSelectedHandler?(selectedDate)
    }
}

