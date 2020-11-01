//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var secondhandSellingContainer: UIView!
    @IBOutlet weak var neighborlifeContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondhandSellingContainer.alpha = 1.0
        neighborlifeContainer.alpha = 0.0
                
        //segmentControl.addUnderlineForSelectedSegment()

    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        //segmentControl.changeUnderlinePosition()
                
        switch sender.selectedSegmentIndex {
            case 0:
                secondhandSellingContainer.alpha = 1.0
                neighborlifeContainer.alpha = 0.0
                categoryBtn.isHidden = false
                break
            case 1:
                secondhandSellingContainer.alpha = 0.0
                neighborlifeContainer.alpha = 1.0
                categoryBtn.isHidden = true
                break
            default:
                break
        }
    }
}

