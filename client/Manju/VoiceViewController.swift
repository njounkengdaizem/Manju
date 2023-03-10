//
//  ViewController.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/9/23.
//

import UIKit
import AVKit
import AVFoundation
import InstantSearchVoiceOverlay


class VoiceViewController: UIViewController{
    var myViewModel = ManjuViewModel()
    let synthesizer = AVSpeechSynthesizer()
    let voiceOverlay = VoiceOverlayController()
    
    
//    @IBOutlet weak var micImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var micImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        micButton.setTitle("", for: .normal)
        micButton.setImage(UIImage(named:"mic.fill"), for: .normal)
        micButton.tintColor = .systemTeal
        micImage.image = UIImage(named: "teal")
        introText.text = "I Am Manju"
        introText.textColor = .white
        subText.text = "'Manju, what is the time?'"
        subText.textColor = .white
        startSpeech(say: "Hello, I am Manju")
        startSpeech(say: "You can say, Manju tell me a python joke")
    }
    
    @IBAction func didTapButtpn(){
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStopTimeout=2
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
            
            if final{
                print(self.myViewModel.response)
//                let manjuResponse = self.myViewModel.response
//                self.startSpeech(say: manjuResponse[0])
                print("Final text: \(text)")
            }
            else{
                // print("In Progress: \(text)")
            }
            
        }, errorHandler: {error in
            
        })
    }
    
    //    func recording(text: String?, final: Bool?, error: Error?) {
    //        <#code#>
    //    }
    
    
    func startSpeech(say: String) {
        let utterance = AVSpeechUtterance(string: say)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.synthesizer.speak(utterance)
        }
    }
    
}
