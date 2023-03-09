import UIKit
import InstantSearchVoiceOverlay

class VoiceOverlayViewController: UIViewController {

    var voiceOverlay: VoiceOverlayController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.voiceOverlay = VoiceOverlayController()
    }

    func startListening(textHandler: @escaping (String, Bool) -> Void) {
        self.voiceOverlay?.start(on: self, textHandler: { text, final, _ in
            textHandler(text, final)
        }, errorHandler: { error in })
    }

//    func stopListening() {
//        self.voiceOverlay?.stop()
//    }
}
