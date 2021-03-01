//
//  PlayerView.swift
//  Radio
//
//  Created by Денис Магильницкий on 17.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

final class PlayerView: UIView {
    // ShareButton - ImageView - Song/Artist_label - Play/Pause_Button
    //                                   |
    //                        Vertical Stack: SongLabel
    //                                   |
    //                               ArtistLabel
    
    // MARK: - Properties
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "up-arrow.png"), for: .normal)
//        button.setTitle("Share", for: .normal)
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 1.0
//        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let albumImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "Settings.png"))
        return imageView
    }()
    
    private let songLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Some song"
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.text = "Some artist"
       return label
    }()
    
    private lazy var infoStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [songLabel, artistLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleToFill
//        stackView.spacing = 0
        return stackView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShareButton()
        setupAlbumImageView()
        setupInfoStackView()
        setupPlayButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShareButton() {
        addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shareButton.widthAnchor.constraint(equalToConstant: 25),
            shareButton.heightAnchor.constraint(equalTo: shareButton.widthAnchor),
            shareButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            shareButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupAlbumImageView() {
        addSubview(albumImageView)
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 8),
            albumImageView.widthAnchor.constraint(equalToConstant: 50),
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor),
            albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupInfoStackView() {
        addSubview(infoStackView)
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 8),
            infoStackView.topAnchor.constraint(equalTo: albumImageView.firstBaselineAnchor)
        ])
    }
    
    private func setupPlayButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 50),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            playButton.leadingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 8),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        print("Share button pressed!")
    }
}
