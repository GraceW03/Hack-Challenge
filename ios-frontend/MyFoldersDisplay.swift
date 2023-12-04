import Foundation
import SnapKit
import UIKit

protocol ExpandFolder : AnyObject {
    func showSets(folder : Folder)
}

class DisplayFoldersVC: UIViewController {
  
  //MARK - Properties (view)
  
  //MARK - Properties (data)
  weak var folderDelegate : ExpandFolder?
  private var collectionView : UICollectionView!
  private var folders : [Folder] = []
   
  // MARK - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    title = "My Folders"
    navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = UIColor.white

    setupCollectionView()

    //helper methods for setting up views
  }
    

  // MARK - Set Up Views
  private func setupCollectionView() {

    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical

	  // Initialize CollectionView with the layout
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.alwaysBounceVertical = true			
	  collectionView.register(FolderCell.self, forCellWithReuseIdentifier: FolderCell.reuse) // 5
	  collectionView.delegate = self 
	  collectionView.dataSource = self 
		
	  view.addSubview(collectionView)

    collectionView.snp.makeConstraints { make in
          make.leading.equalToSuperview().offset(55)
          make.top.equalToSuperview().offset(129)
          make.trailing.equalToSuperview().offset(-55)
          make.bottom.equalToSuperview().offset(-201)
    }

  }

  // MARK: - Button Actions

  func expandFolder(folder : Folder) {
    NetworkManager.shared.getAllCategoriesInFolder(folderName : folder.name) { success in
            if success {
                let insideFolderVC = InsideFolderVC(folder: folder, delegate: self)
                navigationController?.pushViewController(insideFolderVC, animated: true)
            } else {
                
            }
        }
  }

}

extension DisplayFoldersVC : NewFolders {
    addNewFolder(newFolder : String) {
      Folder f = Folder(name : newFolder, cards : [])
      folders.append(f)
    }
}

extension DisplayFoldersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, 
    didSelectItemAt indexPath: IndexPath) {
      guard let f = collectionView.cellForItem(at: indexPath) as? FolderCell else {
            return
          }
      selectedFolder = folders[indexPath.item]
      f.configure(folder: folders[indexPath.item])
      collectionView.reloadItems(at: [indexPath])
      let ff = folders[indexPath.item]
      expandFolder(folder : f)
    }
}

// 7. Conform to `UICollectionViewDataSource`
extension DisplayFoldersVC: UICollectionViewDataSource {
    // `cellForItemAt`
    // `numberOfItemInSection`
    // Additional functions here
}

// 8. Conform to `UICollectionViewDelegateFlowLayout`
extension DisplayFoldersVC: UICollectionViewDelegateFlowLayout {
    // `sizeForItemAt`
    // Additional functions here
}
