//
//  RadioStationsView.swift
//  Radio
//
//  Created by Денис Магильницкий on 17.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class RadioStationsView: UIView {
    // MARK: - Properties
    private let stationImageView = StationImageView()
    private let verticalInset: CGFloat = 8
    private let horizontalInset: CGFloat = 16
    private let cellIdentifier = "cellIdentifier"
    private let collectionCellHeightMultiplier: CGFloat = 1.2
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 32
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(RadioStationCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = (collectionView.frame.width - horizontalInset * 2 - flowLayout.minimumInteritemSpacing * 2) / 3
        let height = width * collectionCellHeightMultiplier
        let itemSize = CGSize(width: width, height: height)
        flowLayout.itemSize = itemSize
    }
    
}

// MARK: - UICollectionViewDataSource
extension RadioStationsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView .dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? RadioStationCollectionViewCell
          else { fatalError("Dequeued Unregistered Cell") }
//        let username = userStories[indexPath.item].username
//        cell.configureCell(imageName: username.rawValue)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension RadioStationsView: UICollectionViewDelegate {
    
}
