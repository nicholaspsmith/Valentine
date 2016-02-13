//
//  FirstViewController.swift
//  Valentine
//
//  Created by Nick on 1/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import AVFoundation

class SongsVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentSongLbl: UILabel!
    @IBOutlet weak var currentArtistLbl: UILabel!
    
    var songCounter = 0
    var musicPlayer: AVAudioPlayer!
    var songs = [
        ["name":"Cruise","artist":"Florida Georgia Line","filename":"cruise"],
        ["name":"You and I","artist":"Ingrid Michaelson","filename":"youandi"],
        ["name":"Anywhere With You","artist":"Josh Owen","filename":"anywherewithyou"],
        ["name":"Your Man","artist":"Josh Turner","filename":"yourman"],
        ["name":"Get Your Shine On","artist":"Florida Georgia Line","filename":"getyourshineon"],
        ["name":"Going to the Chapel","artist":"The Dixie Cups","filename":"chapel"],
        ["name":"When I'm 64","artist":"The Beatles","filename":"64"]
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
        songCounter = indexPath.row
        playSong(songs[songCounter]["filename"]!)
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
            musicPlayer.delegate = self
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 0
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
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        nextPressed(self)
    }
    
}

