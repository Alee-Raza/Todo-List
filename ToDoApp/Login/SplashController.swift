//
//  SplashController.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit
import AVFoundation


class SplashController: UIViewController {
    
    //MARK: - Variables
    
    private let titleLabel = Label(text: "Welcome to To Do list app", font: .boldSystemFont(ofSize: 45), textColor: .black, textAlignment: .center)
    private let signupButton = Button(image: nil, backgroundColor: .systemBlue, cornerRadius: 20, title: "Sign Up", font: 20 , color: .white, tintColor: .black)
    private let signInButton = Button(image: nil, backgroundColor: .systemBlue, cornerRadius: 20, title: "Sign in", font: 20 , color: .white, tintColor: .black)
    private let circle1 = CircleView(backgroundColor: .systemBlue, cornerRadius: 70, clipsToBound: true)
    private let circle2 = CircleView(backgroundColor: .systemBlue, cornerRadius: 50, clipsToBound: true)
    private let circle3 = CircleView(backgroundColor: .systemBlue, cornerRadius: 50, clipsToBound: true)
    
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        handleTargets()
        animateCircles()
    }
    
    //MARK: - Functions
    
    private func setupViews(){
        view.addSubview(circle1)
        view.addSubview(circle2)
        view.addSubview(circle3)
        view.addSubview(titleLabel)
        view.addSubview(signupButton)
        view.addSubview(signInButton)
        
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
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            signInButton.bottomAnchor.constraint(equalTo: signupButton.topAnchor,constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            signupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func handleTargets() {
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func animateCircles() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            // Scale up the circles
            self.circle1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.circle2.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.circle3.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: nil)
    }
    
    //MARK: - Selectors
    
    @objc func signupButtonTapped() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func signInButtonTapped() {
        let controller = SignInViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}


