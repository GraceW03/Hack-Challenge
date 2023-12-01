import Foundation
import SnapKit
import UIKit

protocol SetFolderName : AnyObject {
  func setName(name : String)
}

class CreateFolderVC: UIViewController {
  
  //MARK - Properties (view)
  let private folderImage = UIImageView(image: UIImage.image(named: foldericon))
  let private folderName = UITextField()

  //MARK - PROPERTIES (DATA)
  private var text : String = ""
  private weak var delegate : SetFolderName?
   
  // MARK - viewDidLoad
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor.white

      setupFolder()
      //helper methods for setting up views
    }
    

  // MARK - Set Up Views
  private func setupFolder() {
  view.addSubview(folderImage)
  view.addSubview(folderName)

  folderImage.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(124)
          make.top.equalToSuperview().offset(183)
          make.trailing.equalToSuperview().offset(-114)
          make.bottom.equalToSuperview().offset(-522)
        }

  folderName.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(144)
          make.top.equalToSuperview().offset(300)
          make.trailing.equalToSuperview().offset(-135)
          make.bottom.equalToSuperview().offset(-463)
        }
  }

  // MARK: - Button Actions

  @objc private func pushSet() {
    let insideFolderVC = InsideFolderVC(text : text, delegate : self) 
    navigationController?.pushViewController(finalFolderVC, animated: true)
    delegate?.setName(name : textField.text ?? "")
  }

}