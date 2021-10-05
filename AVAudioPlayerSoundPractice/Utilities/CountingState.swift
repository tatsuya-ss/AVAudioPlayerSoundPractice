//
//  CountingState.swift
//  AVAudioPlayerSoundPractice
//
//  Created by 坂本龍哉 on 2021/10/05.
//

import Foundation

struct CountingState {
    
    var startDate: Date
    
    var countingSeconds: Int
    
    var endDate: Date {
        startDate.addingTimeInterval(TimeInterval(countingSeconds))
    }
    
    func isFinish(now: Date) -> Bool {
        now > endDate
    }
    
    func makeCountText(now: Date) -> String {
        String(Int(endDate.timeIntervalSince1970 - now.timeIntervalSince1970 + 1))
    }
    
}
