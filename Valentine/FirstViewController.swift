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
    
    var songCounter = 0
    var musicPlayer: AVAudioPlayer!
    var songs = ["cruise","youandi"]

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
        } catch let err as NSError {
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
        print(songCounter)
        playSong(songs[songCounter])
    }

}

