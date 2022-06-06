//
//  ViewController.swift
//  Xylophone
//
//  Created by Valery Keplin on 6.06.22.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {

    override var shouldAutorotate: Bool {
        false
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(sender.titleLabel?.text ?? "errorSound")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(800)) {
            sender.alpha = 1
        }
    }
}

func playSound(_ resource: String) {
    let url = Bundle.main.url(forResource: resource, withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
}
