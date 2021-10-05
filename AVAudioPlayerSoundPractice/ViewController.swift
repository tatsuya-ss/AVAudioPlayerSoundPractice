//
//  ViewController.swift
//  AVAudioPlayerSoundPractice
//
//  Created by 坂本龍哉 on 2021/10/04.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countTextField: UITextField!
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAVAudioPlayer()
        countTextField.keyboardType = .numberPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        countTextField.resignFirstResponder()
    }
    
    // TODO: バックグラウンドでタイムアップした時は、ローカル通知を送る方向で検討
    @IBAction func soundButtonDidTap(_ sender: Any) {
        defer { countTextField.resignFirstResponder() }
        guard let count = countTextField.text,
              !count.isEmpty,
              let countInt = Int(count) else { return }
        audioPlayer?.currentTime = 0
        let countingState = CountingState(startDate: .now,
                                          countingSeconds: countInt)
        countLabel.text = String(countingState.countingSeconds)
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] timer in
            self?.countLabel.text = countingState.makeCountText(now: .now)
            if countingState.isFinish(now: .now) {
                timer.invalidate()
                self?.audioPlayer?.play()
                print("タイマー終了")
            }
        })
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
