//
//  ViewController.swift
//  AppleMusic
//
//  Created by 이원석 on 2020/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wholeScrollView: UIScrollView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    @IBOutlet weak var fourthCollectionView: UICollectionView!
    @IBOutlet weak var fifthCollectionView: UICollectionView!
    @IBOutlet weak var sixthCollectionView: UICollectionView!
    @IBOutlet weak var trialButton: UIButton!
    
    var firstData : [BigRectangle] = []
    var secondData : [MiddleSquare] = []
    var thirdData : [SmallRectangle] = []
    var fourthData : [MiddleSquare] = []
    var fifthData : [MiddleSquare] = []
    var sixthData : [MiddleSquare] = []
    
    var minItemSpacing: CGFloat = 10
    var previousIndex = 0
    var isOneStepPaging = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.alpha = 0.95
        
        setFirstData()
        firstCollectionView.register(BigRectangleCell.nib(), forCellWithReuseIdentifier: BigRectangleCell.identifier)
        firstCollectionView.contentInsetAdjustmentBehavior = .never
        firstCollectionView.decelerationRate = .fast
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        
        setSecondData()
        secondCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        setThirdData()
        thirdCollectionView.register(SmallRectangleCell.nib(), forCellWithReuseIdentifier: SmallRectangleCell.identifier)
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        
        setFourthData()
        fourthCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        fourthCollectionView.delegate = self
        fourthCollectionView.dataSource = self
        
//        setFifthData()
//        fifthCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
//        fifthCollectionView.delegate = self
//        fifthCollectionView.dataSource = self
        
        setSixthData()
        sixthCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        sixthCollectionView.contentInsetAdjustmentBehavior = .never
        sixthCollectionView.decelerationRate = .fast
        sixthCollectionView.delegate = self
        sixthCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        trialButton.setTitleColor(UIColor.white, for: .normal)
        //applying the line break mode
        trialButton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "Music\n3개월 무료 체험 지금 시작하기"

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

        //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont(name: "Arial", size: 20.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

        let font2: UIFont = UIFont(name: "Arial", size: 15.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

        //appending both attributed strings
        attrString1.append(attrString2)
        
        //assigning the resultant attributed strings to the button
        trialButton?.setAttributedTitle(attrString1, for: [])
        trialButton.titleLabel?.textAlignment = .center
        
    }
    
    func setFirstData() {
        firstData.append(contentsOf: [
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
        ])
    }
    
    func setSecondData() {
        secondData.append(contentsOf: [
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
        ])
    }
    
    func setThirdData() {
        thirdData.append(contentsOf: [
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
        ])
    }
    
    func setFourthData() {
        fourthData.append(contentsOf: [
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
        ])
    }
    
    func setSixthData() {
        sixthData.append(contentsOf: [
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumart1", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
        ])
    }
}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.firstCollectionView {
            return firstData.count
        }else if collectionView == self.secondCollectionView {
            return secondData.count
        }else if collectionView == self.thirdCollectionView{
            return thirdData.count
        }else if collectionView == self.fourthCollectionView {
            return fourthData.count
        }else if collectionView == self.sixthCollectionView {
            return sixthData.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.firstCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigRectangleCell.identifier, for: indexPath) as? BigRectangleCell else{
                return UICollectionViewCell()
            }
            
            cell.setBingRectangleData(imageName: firstData[indexPath.row].bannerName, categoryName: firstData[indexPath.row].categoryName, musicName: firstData[indexPath.row].musicName, singerName: firstData[indexPath.row].singerName)
            
            return cell
        }else if collectionView == self.secondCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleSquareCell.identifier, for: indexPath) as? MiddleSquareCell else {
                return UICollectionViewCell()
            }
            
            cell.setMiddleSquareData(ImageName: secondData[indexPath.row].albumArtName, firstLabel: secondData[indexPath.row].firstLabelName, secondLabel: secondData[indexPath.row].secondLabelName)
            
            return cell
            
        }else if collectionView == self.thirdCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRectangleCell.identifier, for: indexPath) as? SmallRectangleCell else {
                return UICollectionViewCell()
            }
            
            cell.setSmallRectangleData(imageName: thirdData[indexPath.row].imageName, firstLabelName: thirdData[indexPath.row].firstLabelName)
            
            return cell
            
        }else if collectionView == self.fourthCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleSquareCell.identifier, for: indexPath) as? MiddleSquareCell else {
                return UICollectionViewCell()
            }
            
            cell.setMiddleSquareData(ImageName: fourthData[indexPath.row].albumArtName, firstLabel: fourthData[indexPath.row].firstLabelName, secondLabel: fourthData[indexPath.row].secondLabelName)
            
            return cell
            
        }else if collectionView == self.sixthCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleSquareCell.identifier, for: indexPath) as? MiddleSquareCell else {
                return UICollectionViewCell()
            }
            
            cell.setMiddleSquareData(ImageName: sixthData[indexPath.row].albumArtName, firstLabel: sixthData[indexPath.row].firstLabelName, secondLabel: sixthData[indexPath.row].secondLabelName)
            
            return cell
            
        }else{
            return UICollectionViewCell()
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.firstCollectionView {
            return CGSize(width: collectionView.frame.width-40, height: collectionView.frame.height)

        }else if collectionView == self.secondCollectionView {
            return CGSize(width: (collectionView.frame.width-40)/2, height: collectionView.frame.height)
        }else if collectionView == self.thirdCollectionView {
            return CGSize(width: (collectionView.frame.width-40)/2, height: collectionView.frame.height)
        }else if collectionView == self.fourthCollectionView {
            return CGSize(width: (collectionView.frame.width-40)/2, height: collectionView.frame.height)
        }else if collectionView == self.sixthCollectionView {
            return CGSize(width: (collectionView.frame.width-50)/2, height: (collectionView.frame.height-20)/2)
        }else{
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == self.firstCollectionView {
            return 10
        }else if collectionView == self.secondCollectionView {
            return 10
        }else if collectionView == self.thirdCollectionView {
            return 10
        }else if collectionView == self.fourthCollectionView {
            return 10
        }else if collectionView == self.sixthCollectionView {
            return 10
        }else{
            return 0
        }
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        
        if collectionView == self.firstCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        }else if collectionView == self.secondCollectionView {
            return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        }else if collectionView == self.thirdCollectionView {
            return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
        }else if collectionView == self.fourthCollectionView {
            return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        }else if collectionView == self.sixthCollectionView {
            return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    // MARK: Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        if scrollView == self.firstCollectionView {
            let cellWidthIncludeSpacing = (self.firstCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
            
        }else if scrollView == self.sixthCollectionView {
            let cellWidthIncludeSpacing = (self.firstCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
            
        }
    }
}
