//
//  RegistrationViewController.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Variables
        
    let backButton = Button(image: UIImage(systemName: "chevron.left"), backgroundColor: .clear, cornerRadius: 0, title: "", font: 40, color: .clear, tintColor: .black)
    let topLabel = Label(text: " Sign Up ", font: .boldSystemFont(ofSize: 45), textColor: .black, textAlignment: .center)
    let continueButton = Button(image: nil, backgroundColor: .systemBlue, cornerRadius: 20, title: "Continue", font: 20 , color: .white, tintColor: .black)
    
    private let circle1 = CircleView(backgroundColor: .systemBlue, cornerRadius: 70, clipsToBound: true)
    private let circle2 = CircleView(backgroundColor: .systemBlue, cornerRadius: 50, clipsToBound: true)
    private let circle3 = CircleView(backgroundColor: .systemBlue, cornerRadius: 50, clipsToBound: true)
    
    
    var headingTopConstant: CGFloat = 88
    //MARK: - Lifecycle Functions
    
    init(isLoggedIn: Bool = false){
        super.init(nibName: nil, bundle: nil)
        if isLoggedIn {
            headingTopConstant = 88
        } else {
            headingTopConstant = 200
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTaps()
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        setupViews()
        animateCircles()
    }
    
    //MARK: - Functions
    
    func setupViews(){
        view.addSubview(circle1)
        view.addSubview(circle2)
        view.addSubview(circle3)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            
            circle1.topAnchor.constraint(equalTo: view.topAnchor,constant: -10),
            circle1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -10),
            circle1.heightAnchor.constraint(equalToConstant: 140),
            circle1.widthAnchor.constraint(equalToConstant: 140),
            
            circle2.topAnchor.constraint(equalTo: circle1.bottomAnchor,constant: 80),
            circle2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            circle2.heightAnchor.constraint(equalToConstant: 100),
            circle2.widthAnchor.constraint(equalToConstant: 100),
            
            circle3.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            circle3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 30),
            circle3.heightAnchor.constraint(equalToConstant: 100),
            circle3.widthAnchor.constraint(equalToConstant: 100),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            backButton.heightAnchor.constraint(equalToConstant: 80),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            
            topLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: headingTopConstant),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func animateCircles() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            // Scale up the circles
            self.circle1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.circle2.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.circle3.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: nil)
    }
    
    private func handleTaps(){
        backButton.didTappedContinue = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
