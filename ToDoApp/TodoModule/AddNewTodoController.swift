//
//  AddNewTodoController.swift
//  ToDoApp
//
//  Created by Ali Raza on 02/07/2024.
//

import UIKit

class AddNewTodoController: BaseViewController , UITextFieldDelegate {
    
    
    private var todoCurrentDate = Date()
    
    private lazy var addTitleField : TextField = {
        let title = TextField(placeholder: "Title", cornerRadius: 40, backgroundColor: .clear, borderColor: .black)
        title.addTarget(self, action: #selector(textfieldDidChangeEditing), for: .editingChanged)
        title.delegate = self //
        return title
    }()
    
    private lazy var datePicker: DatePicker = {
        let picker = DatePicker(mode: .date, backgroundColor: .white, cornerRadius: 10)
        picker.addTarget(self, action: #selector(datePcikerdidChanged), for: .valueChanged)
        picker.minimumDate = Date()
        return picker
    }()
    
    private var isComingFromEdit: Bool = false
    private var prevTodo: Todo?
    
    init(todo: Todo? = nil, isComingFromEdit: Bool = false) {
        super.init(isLoggedIn: true)
        
        self.prevTodo = todo
        self.isComingFromEdit = isComingFromEdit
        
        // If coming from edit, populate the fields with existing todo details
        if let todo = todo, isComingFromEdit {
            topLabel.text = "Update Todo"
            continueButton.setTitle("Update", for: .normal)
            addTitleField.text = todo.todoTitle
            datePicker.date = todo.dueDate ?? Date()
            continueButton.enable()
        } else {
            topLabel.text = "Add Todo"
            continueButton.setTitle("Add", for: .normal)
            continueButton.disable()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleControllerUtils()
        bindViews()
        view.backgroundColor = .white
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(addTitleField)
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            
            addTitleField.topAnchor.constraint(equalTo: topLabel.bottomAnchor,constant: 40),
            addTitleField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            addTitleField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            addTitleField.heightAnchor.constraint(equalToConstant: 60),
            
            datePicker.topAnchor.constraint(equalTo: addTitleField.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: addTitleField.centerXAnchor),
        ])
    }
    
    
    private func bindViews() {
        continueButton.didTappedContinue = {
            if let todo = self.prevTodo, self.isComingFromEdit {
                // Call updateTodo if editing an existing todo
                CoreDataManager.shared.updateTodo(todo: todo, newTitle: self.addTitleField.text ?? "", newDueDate: self.datePicker.date)
            } else {
                self.insertTodoItem(dueDate: self.todoCurrentDate, todoTitle: self.addTitleField.text ?? "")
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func handleControllerUtils() {
        if isComingFromEdit {
            topLabel.text = "Update Todo"
            continueButton.setTitle("Update", for: .normal)
        } else {
            topLabel.text = "Add Todo"
            continueButton.setTitle("Add", for: .normal)
            continueButton.disable()
        }
    }
    
    private func insertTodoItem(dueDate: Date, todoTitle: String) {
        let context = CoreDataManager.shared.context
        let todo = Todo(context: context)
        todo.dueDate = dueDate
        todo.todoTitle = todoTitle
        CoreDataManager.shared.saveContext()
    }
    @objc func textfieldDidChangeEditing(){
        
        guard let textField = addTitleField.text else {return}
        
        if textField.count > 3 {
            self.continueButton.enable()
        } else {
            self.continueButton.disable()
        }
    }
    
    @objc func datePcikerdidChanged(){
        todoCurrentDate = datePicker.date
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 50
    }
}
