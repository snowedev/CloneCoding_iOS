//
//  ProductDetailViewController.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productImageVIew: UIImageView!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var uploadTimeLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    var prolist: ProList? // ProList정보를 받을 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProductInfo()
        // Do any additional setup after loading the view.
    }
    
    func setProductInfo() {
        if let prolist = prolist {
            locLabel.text = prolist.loc
            productNameLabel.text = prolist.proname
            uploadTimeLabel.text = prolist.uploadtime
            productImageVIew.image = prolist.makeProductImage()
        }
        
//        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.height / 2
        
        
    }
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
