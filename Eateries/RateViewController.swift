//
//  RateViewController.swift
//  Eateries
//
//  Created by Arthur on 06.02.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBOutlet weak var brilliantButton: UIButton!
    
    @IBOutlet weak var goodButton: UIButton!
    
    @IBOutlet weak var badButton: UIButton!
    
    var restRating: String?
    @IBAction func rateRestaurant(sender: UIButton){
        switch sender.tag {
        case 0:
            restRating = "brilliant"
        case 1:
            restRating = "good"
        case 2:
            restRating = "bad"
        default:
            break
        }
        performSegue(withIdentifier: "unwindSeguetoDVC", sender: sender)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.4) {
////            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
////        }
            let buttonArray = [goodButton, badButton, brilliantButton]
        for (index, button) in buttonArray.enumerated(){
            let delay = Double(index) * 0.2
            UIView.animate(withDuration: 0.3, delay: delay, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
