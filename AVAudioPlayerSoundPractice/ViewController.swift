//
//  ViewController.swift
//  AVAudioPlayerSoundPractice
//
//  Created by 坂本龍哉 on 2021/10/04.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAVAudioPlayer()
    }

    @IBAction func soundButtonDidTap(_ sender: Any) {
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
    }
    
    private func setupAVAudioPlayer() {
        guard let soundFilePath = Bundle.main.path(forResource: "BellSound", ofType: "mp3") else { return }
        let soundURL = URL(fileURLWithPath: soundFilePath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error)
        }
        audioPlayer?.prepareToPlay()
    }

}

