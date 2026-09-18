//
//  AudioManagerViewModel.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/18/26.
//

import Foundation
import AVKit

class AudioManagerViewModel{
    
    private var changeAudioPlayer: AVAudioPlayer?
    func playback(_ team : Team){
        if team.isPlaying
        {
            changeAudioPlayer?.stop()
            
        }else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            
            let url = URL(fileURLWithPath: path)
            do {
                changeAudioPlayer = try AVAudioPlayer(contentsOf: url)
                changeAudioPlayer?.numberOfLoops = -1
                changeAudioPlayer?.play()
            }
            catch {
                print(error)
            }
        }
    }
    
}
