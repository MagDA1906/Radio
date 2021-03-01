//
//  SettingsView.swift
//  Radio
//
//  Created by Денис Магильницкий on 17.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class SettingsView: UIView {
    // MARK: - Properties
    private let scrollView = UIScrollView()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            frameLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        setupButtons()
    }
}

extension SettingsView {
    private func createButton(text: String, color: UIColor = .blue) -> UIButton {
        let button = UIButton(type: .system)
        translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        button.backgroundColor = .yellow
        
        button.setTitle(text, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonPressed() {
        // TODO: Add button pressed action
        
        print("Button pressed!")
    }
    
    func setupButtons() {
        let buttonTitles = ["ALL", "A-Z", "NEW", "BASS", "BREAKS", "CHILL", "DRUM", "HARD", "HOUSE", "OLDSCHOOL", "POP", "RAP/URBAN", "RUSSIAN", "SPECIAL", "TECHNO", "TRANCE"]
        
        let buttonStack = UIStackView()
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 8
        
        buttonTitles.forEach { (buttonTitle) in
            buttonStack.addArrangedSubview(createButton(text: buttonTitle))
        }
        
        scrollView.addSubview(buttonStack)
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            buttonStack.heightAnchor.constraint(equalTo: heightAnchor),
            buttonStack.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            buttonStack.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            buttonStack.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }
}
