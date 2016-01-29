//
//  FirstViewController.swift
//  Valentine
//
//  Created by Nick on 1/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var currentSongLbl: UILabel!
    
    var songCounter = 0
    var musicPlayer: AVAudioPlayer!
    var songs = ["cruise","youandi","anywherewithyou","yourman"]
    var songNames = ["Cruise", "You and I", "Anywhere With You", "Your Man"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSong(songs[songCounter])
    }
    
    func playSong(song: String) {
        
        let path = NSBundle.mainBundle().pathForResource(song, ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 1
            musicPlayer.play()
            currentSongLbl.text = songNames[songCounter]
        } catch let err as NSError {
            currentSongLbl.text = "Oops... something went wrong"
            print(err.debugDescription)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextPressed(sender: UIButton) {
        songCounter++
        songCounter %= songs.count
        musicPlayer.stop()
        playSong(songs[songCounter])
    }
    @IBAction func prevPressed(sender: AnyObject) {
        songCounter--
        songCounter %= songs.count
        musicPlayer.stop()
        playSong(songs[songCounter])
    }

    @IBAction func playPausePressed(sender: AnyObject) {
        if musicPlayer.playing {
            musicPlayer.stop()
        } else {
            musicPlayer.play()
        }
    }
}

