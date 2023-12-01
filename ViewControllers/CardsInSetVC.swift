import Foundation
import UIKit
import SnapKit

class CardsInSetVC : UIViewController {

weak var expandSetDelegate : ExpandSet?
var cards : [Card] = []
private let setName = UILabel()
private let photo = UIImageView(image : UIImage(named: placeholderlogo))
private let cardCollectionView = UICollectionView()
private let studyButton = UIButton()

    init(sett: SetFolder, delegate: ExpandSet) {
        self.cards = sett.cards
        self.name = sett.name
        self.expandFolderDelegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.white
        title = setName
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupCards()
    }

    private func setupCards() {

      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical

      cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cardCollectionView.alwaysBounceVertical = true			
	    cardCollectionView.register(SetCell.self, forCellWithReuseIdentifier: SetCell.reuse) // 5
	    cardCollectionView.delegate = self 
	    cardCollectionView.dataSource = self 
		
	    view.addSubview(cardCollectionView)

      cardCollectionView.snp.makeConstraints { make in
          make.leading.equalToSuperview().offset(55)
          make.top.equalToSuperview().offset(129)
          make.trailing.equalToSuperview().offset(-55)
          make.bottom.equalToSuperview().offset(-201)
      }

    }

}

extension InsideFolderVC: UICollectionViewDelegate {
  
}

extension InsideFolderVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let rec = collectionView.dequeueReusableCell(withReuseIdentifier: SetCell.reuse, for: indexPath) as? 
    SetCell 
    else { return UICollectionViewCell() }
      let sett = sets[indexPath.item]
      rec.configure(set: sett)
      return rec
  }

  func collectionView(_ collectionView: UICollectionView, 
  numberOfItemsInSection section: Int) -> Int {
    return sets.count
  }

} 

extension InsideFolderVC: UICollectionViewDelegateFlowLayout {
    // `sizeForItemAt`
    // Additional functions here
    let collectionViewWidth = collectionView.bounds.width
    let cellPadding: CGFloat = 24
    let cellWidth = (collectionViewWidth - cellPadding) / 2
    let cellHeight: CGFloat = 216
            
    return CGSize(width: cellWidth, height: cellHeight)
}