//
//  ViewController.swift
//  sc2796_p4
//
//  Created by Steven Chen on 10/22/21.
//

import UIKit

protocol SongInfoDelegate: class {
    func changeSongName(newName: String)
    func changeSongArtist(newArtist: String)
    func changeSongAlbum(newAlbum: String)
}

private var selectedSongTag: Int!

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 100
    
    let easy = Song(name: "Easy", artist: "Troye Sivan", album: "Easy", albumCover: UIImage(named: "Easy")!)
    let theRoad = Song(name: "The Road", artist: "Faouzia", album: "The Road", albumCover: UIImage(named: "TheRoad")!)
    let beKind = Song(name: "Be Kind(With Halsay)", artist: "Marshmello, Halsay", album: "If This Is The Last Time", albumCover: UIImage(named: "IfThisIsTheLastTime")!)
    let falseConfidence = Song(name: "False Confidence", artist: "Noah Kahan", album: "Busyhead", albumCover: UIImage(named: "Busyhead")!)
    let missAmericanaAndTheHeartbreakPrince = Song(name: "Miss Americana & The Heartbreak Prince", artist: "Taylor Swift", album: "Lover", albumCover: UIImage(named: "Lover")!)
    let theMan = Song(name: "The Man", artist: "Taylor Swift", album: "Lover", albumCover: UIImage(named: "Lover")!)
    let cruelSummer = Song(name: "Cruel Summer", artist: "Taylor Swift", album: "Lover", albumCover: UIImage(named: "Lover")!)
    let lover = Song(name: "Lover", artist: "Taylor Swift", album: "Lover", albumCover: UIImage(named: "Lover")!)
    let me = Song(name: "Me!", artist: "Taylor Swift", album: "Lover", albumCover: UIImage(named: "Lover")!)
    let endOfTime = Song(name: "End of Time", artist: "K-391, Alan Walker, Ahrix", album: "End of Time", albumCover: UIImage(named: "EndOfTime")!)
    let breakMyHeart = Song(name: "Break My Heart", artist: "Dua Lipa", album: "Future Nostalgia", albumCover: UIImage(named: "FutureNostalgia")!)
    let levitating = Song(name: "Levitating (feat. DaBaby)", artist: "Dua Lipa, DaBaby", album: "FutureNostalgia", albumCover: UIImage(named: "FutureNostalgia")!)
    let physical = Song(name: "Physical", artist: "Dua Lipa", album: "Future Nostalgia", albumCover: UIImage(named: "FutureNostalgia")!)
    let cool = Song(name: "Cool", artist: "Dua Lipa", album: "Future Nostalgia", albumCover: UIImage(named: "FutureNostalgia")!)
    let fever = Song(name: "Fever", artist: "Dua Lipa", album: "Future Nostalgia", albumCover: UIImage(named: "FutureNostalgia")!)
    let illWait = Song(name: "I'll Wait", artist: "Kygo, Sasha Sloan", album: "I'll Wait", albumCover: UIImage(named: "illWait")!)
    let falling = Song(name: "Falling", artist: "Trevor Daniel", album: "Falling", albumCover: UIImage(named: "Falling")!)
    
    var songs: [Song]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        songs = [easy, theRoad, beKind, falseConfidence, missAmericanaAndTheHeartbreakPrince, theMan, cruelSummer, lover, me, endOfTime, breakMyHeart, levitating, physical, cool, fever, illWait, falling]
        
        title = "Playlist"
        view.backgroundColor = .black
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.configure(for: song)
        return cell
    }
    
}

extension ViewController: SongInfoDelegate {
    
    func changeSongName(newName: String) {
        songs[selectedSongTag].name = newName
        tableView.reloadData()
    }
    
    func changeSongArtist(newArtist: String) {
        songs[selectedSongTag].artist = newArtist
        tableView.reloadData()
    }
    
    func changeSongAlbum(newAlbum: String) {
        songs[selectedSongTag].album = newAlbum
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSong = songs[indexPath.row]
        let EditSongViewController = EditSongViewController(placeHolderNameText: selectedSong.name, placeHolderArtistText: selectedSong.artist, placeHolderAlbumText: selectedSong.album, coverImage: selectedSong.albumCover)
        selectedSongTag = indexPath.row
        EditSongViewController.modalPresentationStyle = .overFullScreen
        EditSongViewController.delegate = self
        present(EditSongViewController, animated: true, completion: nil)
    }

}


