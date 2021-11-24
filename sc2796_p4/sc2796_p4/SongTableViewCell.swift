//
//  SongTableViewCell.swift
//  sc2796_p4
//
//  Created by Steven Chen on 10/22/21.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumNameLabel: UILabel!
    var albumImageView: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        backgroundColor = .black
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        contentView.addSubview(nameLabel)
        
        artistNameLabel = UILabel()
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.adjustsFontSizeToFitWidth = true
        artistNameLabel.textColor = .white
        artistNameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(artistNameLabel)
        
        albumNameLabel = UILabel()
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.adjustsFontSizeToFitWidth = true
        albumNameLabel.textColor = .white
        albumNameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(albumNameLabel)
        
        albumImageView = UIImageView()
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.contentMode = .scaleAspectFit
        contentView.addSubview(albumImageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            albumImageView.heightAnchor.constraint(equalToConstant: 80),
            albumImageView.widthAnchor.constraint(equalToConstant: 80),
            albumImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            albumImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10),
            artistNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            artistNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 30),
            albumNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(for song: Song) {
        nameLabel.text = song.name
        artistNameLabel.text = "Artist: \(song.artist)"
        albumNameLabel.text = "Album: \(song.album)"
        albumImageView.image = song.albumCover
    }
}
