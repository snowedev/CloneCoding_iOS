//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 이원석 on 2020/10/30.
//

import UIKit

class ViewController: UIViewController, CustomSegmentedControlDelegate {
        
    let maxH: CGFloat = 150.0
    let minH: CGFloat = 100.0
    
    //MARK: -Outlet
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
    
    // 플로팅 버튼
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var advertisingButton: UIStackView!
    @IBOutlet weak var secondHandButton: UIStackView!
    
    //MARK: -Floating Button
    // -lazy: 미리 만들어두지 않고 해당 객체가 필요하여 호출이 될 때 생성되도록함
    lazy var buttons: [UIStackView] = [self.advertisingButton, self.secondHandButton] // 띄울 버튼 목록
    var isShowingFloating: Bool = false // 플로팅 버튼 상태
    
    // 플로팅 버튼 클릭시 전체 뷰 어둡게
    lazy var floatingDimView: UIView = {
            let view = UIView(frame: self.view.frame)
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            view.alpha = 0
            view.isHidden = true

            self.view.insertSubview(view, belowSubview: self.floatingStackView)

            return view
        }()
    
    // 본격 플로팅버튼 액션
    @IBAction func folatingAcitonBtn(_ sender: UIButton) {
        if isShowingFloating {
                    buttons.reversed().forEach { button in
                        UIView.animate(withDuration: 0.3) {
                            button.isHidden = true
                            self.view.layoutIfNeeded()
                        }
                    }

                    UIView.animate(withDuration: 0.5, animations: {
                        self.floatingDimView.alpha = 0
                    }) { (_) in
                        self.floatingDimView.isHidden = true
                    }
                } else {

                    self.floatingDimView.isHidden = false

                    UIView.animate(withDuration: 0.5) {
                        self.floatingDimView.alpha = 1
                    }

                    buttons.forEach { [weak self] button in
                        button.isHidden = false
                        button.alpha = 0

                        UIView.animate(withDuration: 0.3) {
                            button.alpha = 1
                            self?.view.layoutIfNeeded()
                        }
                    }
                }

        isShowingFloating = !isShowingFloating

                let image = isShowingFloating ? UIImage(named: "plus_cancel") : UIImage(named: "plus")
                let roatation = isShowingFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity

                UIView.animate(withDuration: 0.3) {
                    sender.setImage(image, for: .normal)
                    sender.transform = roatation
                }
        
    }
    
    
    // 메인 뷰가 로드 될 때 네비 바가 안보여야 함
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: -Segment
    // 세그먼트 인덱스에 따른 액션 활성화
    func change(to index: Int) {
        switch index {
        case 0:
            secondhandSellingContainer.alpha = 1.0
            neighborlifeContainer.alpha = 0.0
            categoryBtn.isHidden = false
            floatingButton.isHidden = false
            break
        case 1:
            secondhandSellingContainer.alpha = 0.0
            neighborlifeContainer.alpha = 1.0
            categoryBtn.isHidden = true
            floatingButton.isHidden = true
            break
        default:
            break
        }
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
    
    //MARK: -Location Select Button
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
