//
//  EditSongViewController.swift
//  sc2796_p4
//
//  Created by Steven Chen on 10/22/21.
//

import UIKit

class EditSongViewController: UIViewController {
    
    weak var delegate: SongInfoDelegate?
    
    var titleLabel: UILabel!
    var albumCoverImageView: UIImageView!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var artistLabel: UILabel!
    var artistTextField: UITextField!
    var albumLabel: UILabel!
    var albumTextField: UITextField!
    var closeButton: UIButton!
    var saveButton: UIButton!
    
    var placeHolderSongNameText: String
    var placeHolderSongArtistText: String
    var placeHolderSongAlbumText: String
    var albumCoverImage: UIImage!
    
    init(placeHolderNameText: String, placeHolderArtistText: String, placeHolderAlbumText: String, coverImage: UIImage) {
        placeHolderSongNameText = placeHolderNameText
        placeHolderSongArtistText = placeHolderArtistText
        placeHolderSongAlbumText = placeHolderAlbumText
        albumCoverImage = coverImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let cancelButtonImage = UIImage(named: "cancelButton")
        closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(cancelButtonImage, for: UIControl.State.normal)
        closeButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        view.addSubview(closeButton)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Edit Song"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        albumCoverImageView = UIImageView(image: albumCoverImage)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.contentMode = .scaleAspectFit
        view.addSubview(albumCoverImageView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Song:"
        nameLabel.textAlignment = .right
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.adjustsFontSizeToFitWidth = true
        nameTextField.text = placeHolderSongNameText
        nameTextField.textAlignment = .left
        nameTextField.textColor = .white
        nameTextField.borderStyle = .roundedRect
        nameTextField.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        nameTextField.layer.borderWidth = 2
        nameTextField.textAlignment = .left
        nameTextField.backgroundColor = .black
        nameTextField.clearsOnBeginEditing = false
        view.addSubview(nameTextField)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.text = "Artist:"
        artistLabel.textAlignment = .right
        artistLabel.font = .systemFont(ofSize: 18)
        artistLabel.textColor = .white
        view.addSubview(artistLabel)
        
        artistTextField = UITextField()
        artistTextField.translatesAutoresizingMaskIntoConstraints = false
        artistTextField.adjustsFontSizeToFitWidth = true
        artistTextField.text = placeHolderSongArtistText
        artistTextField.textAlignment = .left
        artistTextField.textColor = .white
        artistTextField.borderStyle = .roundedRect
        artistTextField.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        artistTextField.layer.borderWidth = 2
        artistTextField.textAlignment = .left
        artistTextField.backgroundColor = .black
        artistTextField.clearsOnBeginEditing = false
        view.addSubview(artistTextField)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.text = "Album:"
        albumLabel.textAlignment = .right
        albumLabel.font = .systemFont(ofSize: 18)
        albumLabel.textColor = .white
        view.addSubview(albumLabel)
        
        albumTextField = UITextField()
        albumTextField.translatesAutoresizingMaskIntoConstraints = false
        albumTextField.adjustsFontSizeToFitWidth = true
        albumTextField.text = placeHolderSongAlbumText
        albumTextField.textAlignment = .left
        albumTextField.textColor = .white
        albumTextField.borderStyle = .roundedRect
        albumTextField.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        albumTextField.layer.borderWidth = 2
        albumTextField.textAlignment = .left
        albumTextField.backgroundColor = .black
        albumTextField.clearsOnBeginEditing = false
        view.addSubview(albumTextField)
        
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .darkGray
        saveButton.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        saveButton.layer.borderWidth = 2
        saveButton.layer.cornerRadius = 3
        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(saveButton)

        // Do any additional setup after loading the view.
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            albumCoverImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            albumCoverImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumCoverImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            albumCoverImageView.heightAnchor.constraint(equalTo: albumCoverImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            nameLabel.widthAnchor.constraint(equalToConstant: 75),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            artistLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            artistLabel.widthAnchor.constraint(equalToConstant: 75),
            artistLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            artistTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            artistTextField.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 20),
            artistTextField.heightAnchor.constraint(equalToConstant: 40),
            artistTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 30),
            albumLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            albumLabel.widthAnchor.constraint(equalToConstant: 75),
            albumLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            albumTextField.topAnchor.constraint(equalTo: artistTextField.bottomAnchor, constant: 30),
            albumTextField.leadingAnchor.constraint(equalTo: albumLabel.trailingAnchor, constant: 20),
            albumTextField.heightAnchor.constraint(equalToConstant: 40),
            albumTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissViewController() {
        if let text = nameTextField.text, text != "" {
            delegate?.changeSongName(newName: text)
        }
        if let text = artistTextField.text, text != "" {
            delegate?.changeSongArtist(newArtist: text)
        }
        if let text = albumTextField.text, text != "" {
            delegate?.changeSongAlbum(newAlbum: text)
        }
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
