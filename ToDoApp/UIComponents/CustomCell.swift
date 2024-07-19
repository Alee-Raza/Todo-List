//
//  CustomCell.swift
//  ToDoApp
//
//  Created by Ali Raza on 03/07/2024.
//

import UIKit

class CustomCell : UITableViewCell {
    
    static let identifier = "CustomCell"
    
    private let mainView: View = {
        let mainView = View(backgroundColor: .white.withAlphaComponent(1), cornerRadius: 30)
        mainView.layer.borderColor = CGColor(gray: 10, alpha: 10)
        mainView.layer.borderWidth = 20
//        mainView.layer.shadowRadius = 2
//        mainView.layer.shadowColor = UIColor.black.cgColor
//        mainView.layer.shadowOffset = CGSize(width: 0, height: 30)
        return mainView
    }()
    
    let titleLabelTodo =  Label(text: "Title", font: .systemFont(ofSize: 25), textColor: .label, textAlignment: .left, cornerRaduis: 2, backgroundColor: .clear, numberOfLines: 0)
    
    let dueDateLabel = Label(text: "Due Date", font: .systemFont(ofSize: 15), textColor: .gray, textAlignment: .left)
    
    private let separatorLine = View(backgroundColor: .lightGray.withAlphaComponent(1), cornerRadius: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(mainView)
        mainView.addSubview(titleLabelTodo)
        mainView.addSubview(dueDateLabel)
        mainView.addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabelTodo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20),
            titleLabelTodo.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20),
            titleLabelTodo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20),
            
            separatorLine.topAnchor.constraint(equalTo: titleLabelTodo.bottomAnchor,constant: 10),
            separatorLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            separatorLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            
            dueDateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            dueDateLabel.topAnchor.constraint(equalTo: separatorLine.bottomAnchor,constant: 20),
            dueDateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        ])
    }
}




