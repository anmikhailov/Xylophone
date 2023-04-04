//
//  ViewController.swift
//  Xylophone
//
//  Created by Andrey on 03.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
		let animationDelay = 0.2
		
        playSound(sound: sender.currentTitle!)
		sender.alpha = 0.5
		DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
			sender.alpha = 1.0
		}
    }
    
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension:"wav") else
        { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
			try AVAudioSession.sharedInstance().setActive(true)
			
			player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

