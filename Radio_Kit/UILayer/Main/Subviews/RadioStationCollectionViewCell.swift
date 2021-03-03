//
//  RadioStationCollectionViewCell.swift
//  Radio
//
//  Created by Денис Магильницкий on 25.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class RadioStationCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    let stationView = StationImageView()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupStationImageView()
    }
    
    // MARK: - Layouts
    private func setupStationImageView() {
        contentView.addSubview(stationView)
        stationView.translatesAutoresizingMaskIntoConstraints = false
        stationView.fillSuperview()
    }
    
    func configureCell() {
        // TODO: Set config for cell
    }
}
