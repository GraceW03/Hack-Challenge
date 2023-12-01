import Foundation
import UIKit
import SnapKit

protocol ExpandSet : AnyObject {
  expandSet(sett : SetFolder) {

  }
}

class InsideFolderVC : UIViewController {

weak var expandFolderDelegate : ExpandFolder?
var sets : [SetFolder] = []
private let name : String = ""
private let cardCollectionView = UICollectionView()

    init(folder: Folder, delegate: ExpandFolderDelegate) {
        self.sets = folder.cards
        self.name = folder.name
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
        title = name
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupSets()
    }

    private func setupSets() {

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

    func expandFolder(sett : SetFolder) {
      let cardsInSetVC = CardsInSetVC(set: sett, delegate: self)
      navigationController?.pushViewController(cardsInSetVC, animated: true)
    }

}

extension InsideFolderVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, 
    didSelectItemAt indexPath: IndexPath) {
      guard let f = collectionView.cellForItem(at: indexPath) as? SetCell else {
            return
          }
      selectedSet = sets[indexPath.item]
      f.configure(set: sets[indexPath.item])
      cardCollectionView.reloadItems(at: [indexPath])
      let ff = sets[indexPath.item]
      expandSet(set : ff)
    }
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