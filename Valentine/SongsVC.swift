//
//  FirstViewController.swift
//  Valentine
//
//  Created by Nick on 1/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import AVFoundation

class SongsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentSongLbl: UILabel!
    @IBOutlet weak var currentArtistLbl: UILabel!
    
    var songCounter = 0
    var musicPlayer: AVAudioPlayer!
//    var songs = ["cruise","youandi","anywherewithyou","yourman"]
//    var songNames = ["Cruise", "You and I", "Anywhere With You", "Your Man"]
    
    var songs = [
        ["name":"Cruise","artist":"Florida Georgia Line","filename":"cruise"],
        ["name":"You and I","artist":"Ingrid Michaelson","filename":"youandi"],
        ["name":"Anywhere With You","artist":"Josh Owen","filename":"anywherewithyou"],
        ["name":"Your Man","artist":"Josh Turner","filename":"yourman"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        playSong(songs[songCounter]["filename"]!)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier("SongCell") as? SongCell {
            cell.configureCell(songs[indexPath.row]["name"]!, artist: songs[indexPath.row]["artist"]!)
            return cell
        } else {
            return SongCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // @TODO
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    
    //              //
    // Music Player //
    //              //
    
    func playSong(song: String) {
        
        let path = NSBundle.mainBundle().pathForResource(song, ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 1
            musicPlayer.play()
            currentSongLbl.text = songs[songCounter]["name"]!
            currentArtistLbl.text = songs[songCounter]["artist"]!
        } catch let err as NSError {
            currentSongLbl.text = "Oops... something went wrong"
            print(err.debugDescription)
        }
    }

    @IBAction func nextPressed(sender: AnyObject) {
        songCounter++
        songCounter %= songs.count
        musicPlayer.stop()
        playSong(songs[songCounter]["filename"]!)
    }
    
    @IBAction func prevPressed(sender: AnyObject) {
        songCounter--
        songCounter %= songs.count
        if songCounter < 0 {
            songCounter = songs.count - 1
        }
        musicPlayer.stop()
        playSong(songs[songCounter]["filename"]!)
    }

    @IBAction func playPausePressed(sender: UIButton) {
        if musicPlayer.playing {
            sender.setTitle("►", forState: .Normal)
            musicPlayer.stop()
        } else {
            sender.setTitle("||", forState: .Normal)
            musicPlayer.play()
        }
    }
}

