import Foundation
import SnapKit
import UIKit

protocol FillSet : AnyObject {
  func createItem(term : String, definition : String)
}

class CreateFolderVC: UIViewController {
  
  //MARK - Properties (view)
  let private folderName = UILabel()
  let private userName = UILabel()
  let private termCount = UILabel()
  let private createButton = UIButton()

  //MARK - PROPERTIES (DATA)
  private var term : String = ""
  private var definition : String = ""
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