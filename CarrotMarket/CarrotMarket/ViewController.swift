//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

class ViewController: UIViewController, CustomSegmentedControlDelegate {
    
    // 세그먼트 인덱스에 따른 액션 활성화
    func change(to index: Int) {
        print("\(index)")
        switch index {
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
    
    let maxH: CGFloat = 150.0
    let minH: CGFloat = 100.0
    
    // Outlet
    //Upper Header view 내부 버튼
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var SelectLoactionBtn: UIButton!
    
    // Header View
    @IBOutlet weak var headerView: UIView!
    @IBOutlet var upperHeaderView: UIView!
    @IBOutlet var headerViewHeightConstraint: NSLayoutConstraint!{
        didSet {
                headerViewHeightConstraint.constant = maxH
        }
    }
        
    // 세그먼트
    @IBOutlet weak var interfaceSegmented: CustomSegmentedControl!{
        didSet{
            interfaceSegmented.setButtonTitles(buttonTitles: ["중고거래","동네생활"])
            interfaceSegmented.selectorViewColor = .black
            interfaceSegmented.textColor = .gray
            interfaceSegmented.selectorTextColor = .black
        }
    }
    // 컨테이너 뷰 2개
    @IBOutlet weak var secondhandSellingContainer: UIView!
    @IBOutlet weak var neighborlifeContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interfaceSegmented.delegate = self
        secondhandSellingContainer.alpha = 1.0
        neighborlifeContainer.alpha = 0.0

    }
    
    // 세그먼트 뷰에 값을 넘겨주기 위한 prepare 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondHandSelling",
           let dest = segue.destination as? SecondHandSellingVC
        {
            dest.headerHeight = headerViewHeightConstraint
            dest.upperheader = upperHeaderView
            dest.maxHeight = maxH
            dest.minHeight = minH
        }
    }
    
    // Upper Header View 지역 선택 부분 Action
    @IBAction func SelectLocationPopOver(_ sender: Any) {
        //get the button frame
        /* 1 */
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        contentView.backgroundColor = UIColor.clear
        
        let button = sender as? UIButton
        let buttonFrame = button?.frame ?? CGRect.zero
        let storyboard = UIStoryboard(name: "LocationSelect", bundle: nil)
        
        /* 2 */
        //Configure the presentation controller
        let locationpopoverController = storyboard.instantiateViewController(withIdentifier: "LocationSelectVC") as? LocationSelectVC
        locationpopoverController?.modalPresentationStyle = .popover
        locationpopoverController?.preferredContentSize = CGSize(width:300, height:150) // 모달 사이즈 지정

        /* 3 */
        if let popoverPresentationController = locationpopoverController?.popoverPresentationController {
        popoverPresentationController.permittedArrowDirections = .up
        popoverPresentationController.sourceView = self.view
        popoverPresentationController.sourceRect = buttonFrame
        popoverPresentationController.delegate = self
            
        locationpopoverController?.delegate = self
            
        if let popoverController = locationpopoverController {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
}

// UIPopoverPresentationControllerDelegate
extension ViewController: UIPopoverPresentationControllerDelegate {
    
    // Present 스타일
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
     
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
     
    }
     
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
    return true
    }
}

// 선택된 지역명으로 변경해주기 위해 현재 뷰컨에 .delegate = self를 해야하므로 선언
extension ViewController:PopoverContentControllerDelegate {
    func popoverContent(controller: LocationSelectVC, didselectItem name: String) {
        SelectLoactionBtn.setTitle(name, for: .normal)
    }
}
