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
    
    @IBOutlet weak var greyLine1: UILabel!
    @IBOutlet weak var greyLine2: UILabel!
    @IBOutlet weak var greyLine3: UILabel!
    @IBOutlet weak var greyLine4: UILabel!
    @IBOutlet weak var greyLine5: UILabel!
    
    var firstData : [BigRectangle] = []
    var secondData : [MiddleSquare] = []
    var thirdData : [SmallRectangle] = []
    var fourthData : [MiddleSquare] = []
    var fifthData : [TableShape] = []
    var sixthData : [MiddleSquare] = []
    
    var minItemSpacing: CGFloat = 10
    var previousIndex = 0
    var isOneStepPaging = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
        
        wholeScrollView.delegate = self
        
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
        
        setFifthData()
        fifthCollectionView.register(TableShapeCell.nib(), forCellWithReuseIdentifier: TableShapeCell.identifier)
        fifthCollectionView.contentInsetAdjustmentBehavior = .never
        fifthCollectionView.decelerationRate = .fast
        fifthCollectionView.delegate = self
        fifthCollectionView.dataSource = self
        
        setSixthData()
        sixthCollectionView.register(MiddleSquareCell.nib(), forCellWithReuseIdentifier: MiddleSquareCell.identifier)
        sixthCollectionView.contentInsetAdjustmentBehavior = .never
        sixthCollectionView.decelerationRate = .fast
        sixthCollectionView.delegate = self
        sixthCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let height: CGFloat = 44 //whatever height you want to add to the existing height
        navigationController?.navigationBar.alpha = 0.95
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
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
    
    func viewStyle() {
        self.tabBarController?.tabBar.alpha = 0.95
        self.navigationController?.navigationBar.isHidden = true
//        topHeaderView.isHidden = false
        greyLine1.backgroundColor = .brightDarkGrey
        greyLine2.backgroundColor = .brightDarkGrey
        greyLine3.backgroundColor = .brightDarkGrey
        greyLine4.backgroundColor = .brightDarkGrey
        greyLine5.backgroundColor = .brightDarkGrey
    }
    
    func setFirstData() {
        firstData.append(contentsOf: [
            BigRectangle(bannerName: "apmBan1", categoryName: "기념", musicName: "연말연시에 꼭 맞는 음악", singerName: "가수 이름"),
            BigRectangle(bannerName: "apmBan2", categoryName: "최신 앨범 + 인터뷰", musicName: "Plastic Hearts", singerName: "Miley Cyrus"),
            BigRectangle(bannerName: "apmBan3", categoryName: "더 알아보기", musicName: "피아니스트 존 바티스트가 소개하는 베토벤의 혁신적인 음악세계", singerName: ""),
            BigRectangle(bannerName: "apmBan4", categoryName: "최신앨범", musicName: "NCT RESONANCE Pt. 2 - The 2nd Album", singerName: "NCT"),
            BigRectangle(bannerName: "apmBan5", categoryName: "시청하기", musicName: "머라이어 캐리의 크리스마스 예고편을 Apple TV+에서 확인하세요.", singerName: ""),
        ])
    }
    
    func setSecondData() {
        secondData.append(contentsOf: [
            MiddleSquare(albumArtName: "albumArt1", firstLabelName: "오늘의 신곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "albumArt2", firstLabelName: "오늘의 히트곡", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumArt3", firstLabelName: "Rap Life", secondLabelName: "Apple Music 힙합/웹"),
            MiddleSquare(albumArtName: "albumArt4", firstLabelName: "Loops", secondLabelName: "Apple Music 일렉트로닉"),
            MiddleSquare(albumArtName: "albumArt5", firstLabelName: "A-List: 팝", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "albumArt11", firstLabelName: "ALT CTRL", secondLabelName: "Apple Music 얼터너티브"),
        ])
    }
    
    func setThirdData() {
        thirdData.append(contentsOf: [
            SmallRectangle(imageName: "healing", firstLabelName: "행복"),
            SmallRectangle(imageName: "party", firstLabelName: "파티"),
            SmallRectangle(imageName: "rest", firstLabelName: "휴식"),
            SmallRectangle(imageName: "oldMusic", firstLabelName: "추억의 음악"),
            SmallRectangle(imageName: "willingness", firstLabelName: "의욕"),
            SmallRectangle(imageName: "romance", firstLabelName: "로맨스"),
        ])
    }
    
    func setFourthData() {
        fourthData.append(contentsOf: [
            MiddleSquare(albumArtName: "enjoy1", firstLabelName: "퓨어 히트곡", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy2", firstLabelName: "it's Lit!!!", secondLabelName: "Apple Music 힙합/랩"),
            MiddleSquare(albumArtName: "enjoy3", firstLabelName: "파티 스타터", secondLabelName: "Apple Music 팝"),
            MiddleSquare(albumArtName: "enjoy4", firstLabelName: "온종일 즐기는 댄스파티", secondLabelName: "Apple Music 댄스"),
            MiddleSquare(albumArtName: "enjoy5", firstLabelName: "미드나잇 시티", secondLabelName: "Apple Music 인디"),
            MiddleSquare(albumArtName: "enjoy6", firstLabelName: "다시 듣는 팝", secondLabelName: "Apple Music 팝"),
        ])
    }
    
    func setFifthData() {
        fifthData.append(contentsOf: [
            TableShape(imageName: "smallAlbumArt1", songLabelName: "잘자, 안녕", singerLabelName: "치즈"),
            TableShape(imageName: "smallAlbumArt2", songLabelName: "exile (feat. Bon Iver)", singerLabelName: "Taylor Swift"),
            TableShape(imageName: "smallAlbumArt3", songLabelName: "Jam & Butterfly (feat. Crush & eaJ)", singerLabelName: "DPR Live"),
            TableShape(imageName: "smallAlbumArt4", songLabelName: "monologue", singerLabelName: "sogumm"),
            TableShape(imageName: "smallAlbumArt5", songLabelName: "청춘", singerLabelName: "CIFIKA"),
            TableShape(imageName: "smallAlbumArt6", songLabelName: "baby", singerLabelName: "oceanfromtheblue"),
            TableShape(imageName: "smallAlbumArt7", songLabelName: "Life Goes On", singerLabelName: "방탄소년단"),
            TableShape(imageName: "smallAlbumArt8", songLabelName: "Prisoner (feat. Dua Lipa)", singerLabelName: "Miley Cyrus"),
            TableShape(imageName: "smallAlbumArt9", songLabelName: "Lil Time (feat. AUDREY NUNA)", singerLabelName: "헤일"),
            
            TableShape(imageName: "smallAlbumArt10", songLabelName: "Monster", singerLabelName: "Shawn Mendes & Justin Bieber"),
            TableShape(imageName: "smallAlbumArt11", songLabelName: "꽃집 (feat. SUMIN)", singerLabelName: "그리즐리"),
            TableShape(imageName: "smallAlbumArt12", songLabelName: "2easy (feat. 헤이즈)", singerLabelName: "Nlve"),
        ])
    }
    
    func setSixthData() {
        sixthData.append(contentsOf: [
            MiddleSquare(albumArtName: "smallAlbumArt6", firstLabelName: "Lub fi 2020", secondLabelName: "oceanfromtheblue"),
            MiddleSquare(albumArtName: "albumArt7", firstLabelName: "Christmas Blues", secondLabelName: "Sabrina Claudio"),
            MiddleSquare(albumArtName: "albumArt8", firstLabelName: "Find Myself - EP", secondLabelName: "TREA"),
            MiddleSquare(albumArtName: "smallAlbumArt11", firstLabelName: "꽃집 - EP", secondLabelName: "그리즐리"),
            MiddleSquare(albumArtName: "albumArt9", firstLabelName: "Soft bench - Single", secondLabelName: "off the menu"),
            MiddleSquare(albumArtName: "albumArt10", firstLabelName: "꿈 (feat. 최엘비) - Single", secondLabelName: "QDR"),
            MiddleSquare(albumArtName: "albumArt6", firstLabelName: "Dance Rather Than Love - EP", secondLabelName: "구만"),
            MiddleSquare(albumArtName: "albumArt12", firstLabelName: "바람 불던 밤 - Single", secondLabelName: "젬스톤"),
            MiddleSquare(albumArtName: "albumArt13", firstLabelName: "Fly me Away - EP", secondLabelName: "오아"),
            MiddleSquare(albumArtName: "albumArt14", firstLabelName: "The Parables", secondLabelName: "Cordae"),
            MiddleSquare(albumArtName: "albumArt15", firstLabelName: "Lake Louise - Single", secondLabelName: "유키 구라모토"),
        ])
    }
}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.firstCollectionView {
            return firstData.count
        }else if collectionView == self.secondCollectionView {
            return secondData.count
        }else if collectionView == self.thirdCollectionView{
            return thirdData.count
        }else if collectionView == self.fourthCollectionView {
            return fourthData.count
        }else if collectionView == self.fifthCollectionView {
            return fifthData.count
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
            
        }else if collectionView == self.fifthCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableShapeCell.identifier, for: indexPath) as? TableShapeCell else {
                return UICollectionViewCell()
            }
            
            cell.setTableShape(imageName: fifthData[indexPath.row].imageName, songName: fifthData[indexPath.row].songLabelName, singerName: fifthData[indexPath.row].singerLabelName)
            
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
        }else if collectionView == self.fifthCollectionView {
            return CGSize(width: collectionView.frame.width-40, height: (collectionView.frame.height-40)/4)
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
        }else if collectionView == self.fifthCollectionView {
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
        }else if collectionView == self.fifthCollectionView {
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
            let cellWidthIncludeSpacing = (self.sixthCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
            
        }else if scrollView == self.fifthCollectionView {
            let cellWidthIncludeSpacing = (self.fifthCollectionView.frame.width)-40 + minItemSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
            let roundedIndex: CGFloat = round(index)
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset
            
        }
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.wholeScrollView.contentOffset.y > 20 {
            print("here")
            navigationController?.navigationBar.isHidden = false
        }else{
            navigationController?.navigationBar.isHidden = true
        }
    }
}
