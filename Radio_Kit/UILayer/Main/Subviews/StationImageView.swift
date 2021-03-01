//
//  StationImageView.swift
//  Radio
//
//  Created by Денис Магильницкий on 25.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class StationImageView: UIView {
    // MARK: - Properties
    let boldBorder: Bool
    
    var hasBorder: Bool = false {
        didSet {
            guard hasBorder else { return layer.borderWidth = 0 }
            mainView.layer.borderWidth = boldBorder ? 10 : 2
        }
    }
    
    private let leftInsetView = UIView()
    private let rightInsetView = UIView()
    private let imageView = UIImageView()
//    private let subMainView = UIView()
    
    var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.setCornerRadius()
        return view
    }()
    
    let subMainView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
//        view.setCornerRadius()
        return view
    }()
    
    private lazy var titleStationStackView = UIStackView(arrangedSubviews: [leftInsetView, mainView, rightInsetView])
    
    private let stationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Station name"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStationStackView, stationNameLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Initializers
    init(boldBorder: Bool = false) {
        self.boldBorder = boldBorder
        super.init(frame: .zero)
        setupImageView()
        setupSubMainView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        self.boldBorder = false
        super.init(coder: coder)
    }
    
    private func setupImageView() {
        
        subMainView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [imageView.leadingAnchor.constraint(equalTo: subMainView.leadingAnchor),
             imageView.topAnchor.constraint(equalTo: subMainView.topAnchor),
             imageView.trailingAnchor.constraint(equalTo: subMainView.trailingAnchor),
             imageView.bottomAnchor.constraint(equalTo: subMainView.bottomAnchor)
            ]
        )
    }
    
    private func setupSubMainView() {
        mainView.addSubview(subMainView)
        subMainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [subMainView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
             subMainView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
             subMainView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
             subMainView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
            ]
        )
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let mainViewWidthConstraint = mainView.widthAnchor.constraint(equalToConstant: 60)
        mainViewWidthConstraint.priority = UILayoutPriority(750)
        mainViewWidthConstraint.isActive = true
        
        NSLayoutConstraint.activate(
            [stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
             stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
             
             leftInsetView.widthAnchor.constraint(equalToConstant: 8),
             rightInsetView.widthAnchor.constraint(equalTo: leftInsetView.widthAnchor),

             mainViewWidthConstraint,
//             mainView.widthAnchor.constraint(equalToConstant: 60),
             mainView.heightAnchor.constraint(equalTo: mainView.widthAnchor)
            ]
        )
    }
}
