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
    private let leftInsetView = UIView()
    private let rightInsetView = UIView()
    private let imageView = UIImageView()
    
    private let supportingView = SupportingView(borderShape: .circle, borderWidth: .thin, selfColor: .clear)
    private let subSupportingView = SupportingView(borderShape: .circle, borderWidth: .none, selfColor: .some)
    
    private lazy var titleStationStackView = UIStackView(arrangedSubviews: [leftInsetView, supportingView, rightInsetView])
    
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
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupImageView()
        setupSubMainView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        
        subSupportingView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.fillSuperview()
    }
    
    private func setupSubMainView() {
        supportingView.addSubview(subSupportingView)
        subSupportingView.translatesAutoresizingMaskIntoConstraints = false
        subSupportingView.fillSuperview(withConstant: 4)
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let mainViewWidthConstraint = supportingView.widthAnchor.constraint(equalToConstant: 100) //60
        mainViewWidthConstraint.priority = UILayoutPriority(750)
        mainViewWidthConstraint.isActive = true
        
        NSLayoutConstraint.activate(
            [stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
             stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
             
             leftInsetView.widthAnchor.constraint(equalToConstant: 1),
             rightInsetView.widthAnchor.constraint(equalTo: leftInsetView.widthAnchor),

             mainViewWidthConstraint,
             supportingView.heightAnchor.constraint(equalTo: supportingView.widthAnchor)
            ]
        )
    }
}
