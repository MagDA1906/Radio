//
//  MainView.swift
//  Radio
//
//  Created by Денис Магильницкий on 16.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class MainView: UIView {
    // MARK: - Properties
    let viewModel: MainViewModel
    let settingsView = SettingsView()
    let stationsCollectionView = RadioStationsView()
    let playerView = PlayerView()   /// Prototype is ready
//    let tempPlayerView = TempPlayerView()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [mainLabel, settingsView, stationsCollectionView, playerView])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "RADIO CHANNELS"
        return label
    }()
    
    // MARK: - Initializers
    init(frame: CGRect = .zero, viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//            tempPlayerView.heightAnchor.constraint(equalToConstant: 60)
            playerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        settingsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
