import Foundation
import SnapKit
import UIKit

protocol FillSet : AnyObject {
  func createItem(term : String, definition : String)
}

class CreateSetVC: UIViewController {
  
  //MARK - Properties (view)
  let private folderName = UILabel()
  let private userName = UILabel()
  let private termCount = UILabel()
  let private createButton = UIButton()
  let private termField = UITextField()
  let private descriptionField = UITextField()

  //MARK - PROPERTIES (DATA)
  private var term : String = ""
  private var definition : String = ""
  private weak var delegate : SetFolderName?
   
  // MARK - viewDidLoad
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor.white

      setupCategory()
      //helper methods for setting up views
  }
    

  // MARK - Set Up Views
  private func setupCategory() {
  
  view.addSubview(folderImage)
  view.addSubview(folderName)
  view.addSubview(termCount)
  view.addSubview(createButton)

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
      delegate?.createItem(term : termField.text ?? "", definition: descriptionField.text ?? "")
      NetworkManager.shared.createCategory(categoryID: id, content: term, answer: definition) { success in
            if success {
                let insideFolderVC = InsideFolderVC(text : text, delegate : self) 
    navigationController?.pushViewController(finalFolderVC, animated: true)
            } else {
                // Handle signup failure, show an error message, etc.
            }
        }
  }

}
