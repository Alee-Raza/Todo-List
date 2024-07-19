//
//  ListOfTodoController.swift
//  ToDoApp
//
//  Created by Ali Raza on 02/07/2024.
//

import UIKit

class ListOfTodoController: BaseViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        table.layer.cornerRadius = 10
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    private let addTodoButton = Button(image: UIImage(systemName: "plus"), backgroundColor: .clear, cornerRadius: 0, title: "", font: 100, color: .black, tintColor: .black)
    
    var todos: [Todo] = []
    
    init() {
        super.init(isLoggedIn: true)
        handleControllerUtils()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        todos = CoreDataManager.shared.fetchTodos()
        if todos.isEmpty {
            noRecordFoundViews()
        } else {
            setupViews()
            tableView.reloadData()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(tableView)
        view.addSubview(addTodoButton)
        NSLayoutConstraint.activate([
            
            addTodoButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            addTodoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            addTodoButton.heightAnchor.constraint(equalToConstant: 100),
            addTodoButton.widthAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor,constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    func noRecordFoundViews() {
        view.addSubview(addTodoButton)
        NSLayoutConstraint.activate([
            addTodoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTodoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addTodoButton.heightAnchor.constraint(equalToConstant: 60),
            addTodoButton.widthAnchor.constraint(equalToConstant: 105),
        ])
    }
    
    private func handleTargets() {
        addTodoButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
        let controller = AddNewTodoController()
        navigationController?.pushViewController(controller, animated: true)
    }
    

    private func handleControllerUtils(){
        topLabel.text = "To Do"
        continueButton.alpha = 0
        backButton.alpha = 0
    }
}

extension ListOfTodoController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.selectionStyle = .none
        cell.titleLabelTodo.text = todos[indexPath.row].todoTitle
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        if let dueDate = todos[indexPath.row].dueDate {
            cell.dueDateLabel.text = dateFormatter.string(from: dueDate)
        } else {
            cell.dueDateLabel.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Get the todo to delete
            let todo = todos[indexPath.row]
            CoreDataManager.shared.deleteTodo(todo: todo)
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // If no more todos, show the noRecordFoundViews
            if todos.isEmpty {
                tableView.removeFromSuperview()
                noRecordFoundViews()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = todos[indexPath.row]
        // Pass the selected todo to the AddNewTodoController initializer
        let controller = AddNewTodoController(todo: selectedTodo, isComingFromEdit: true)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
