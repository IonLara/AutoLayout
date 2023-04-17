//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let purpleView: UIView = {
        let purple = UIView()
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.frame(forAlignmentRect: CGRect.zero)
        purple.backgroundColor = .purple
        return purple
    }()
    
    let blue1: UIButton = {
        let blue = UIButton()
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        blue.backgroundColor = .blue
        blue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return blue
    }()
    let blue2: UIButton = {
        let blue = UIButton()
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        blue.backgroundColor = .blue
        blue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return blue
    }()
    let blue3: UIButton = {
        let blue = UIButton()
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.frame(forAlignmentRect: CGRect.zero)
        blue.backgroundColor = .blue
        blue.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return blue
    }()
    
    let stackBlue: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.alignment = .center
        return stack
    }()
    
    let orangeRight: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame(forAlignmentRect: CGRect.zero)
        v.backgroundColor = .orange
        return v
    }()
    
    let orangeLeft: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame(forAlignmentRect: CGRect.zero)
        v.backgroundColor = .orange
        return v
    }()
    
    let redView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame(forAlignmentRect: CGRect.zero)
        v.backgroundColor = .red
        return v
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        view.addSubview(purpleView)
        view.addSubview(stackBlue)
        
        stackBlue.addArrangedSubview(blue1)
        stackBlue.addArrangedSubview(blue2)
        stackBlue.addArrangedSubview(blue3)
        
        view.addSubview(redView)
        view.addSubview(orangeLeft)
        view.addSubview(orangeRight)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        purpleView.leadingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -200).isActive = true
        purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        purpleView.centerYAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -75).isActive = true
        
        //Blue Vertical Stack Anchors
        stackBlue.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        stackBlue.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        stackBlue.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7).isActive = true
        stackBlue.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        
        //Red View Anchors
        redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        redView.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: 95).isActive = true
        redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        redView.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -320).isActive = true
        
        //Orange views Anchors
        orangeLeft.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
        orangeRight.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
        
        orangeLeft.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
        orangeRight.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
        
        orangeLeft.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 10).isActive = true
        orangeLeft.trailingAnchor.constraint(equalTo: redView.centerXAnchor).isActive = true
        
        orangeRight.leadingAnchor.constraint(equalTo: orangeLeft.trailingAnchor, constant: 10).isActive = true
        orangeRight.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -10).isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

