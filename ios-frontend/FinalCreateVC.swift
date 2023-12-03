import Foundation
import SnapKit
import UIKit

protocol NewFolders : AnyObject {
  func addNewFolder(newFolder : String)
}

class FinalCreateVC: UIViewController {
  
  //MARK - Properties (view)
  private let folderLabel = UILabel()
  private let folderImage = UIImageView(image: UIImage(named: foldericon))
  private let createButton = UIButton()
    
  //MARK - Properties (data)
  private var name : String = ""
  private weak delegate : SetFolderName?
   
  // MARK - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    setupFolder()
    setupButton()
      //helper methods for setting up views
  }
  
  init(text: String, delegate: SetFolderName) {
    self.text = text
    self.delegate = delegate

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    

  // MARK - Set Up Views

  private func setupFolder() {

  view.addSubview(folderImage)
  view.addSubview(folderLabel)

  folderImage.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(124)
          make.top.equalToSuperview().offset(183)
          make.trailing.equalToSuperview().offset(-114)
          make.bottom.equalToSuperview().offset(-522)
        }

  folderLabel.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(144)
          make.top.equalToSuperview().offset(300)
          make.trailing.equalToSuperview().offset(-135)
          make.bottom.equalToSuperview().offset(-463)
        }
  }

  private func setupButton() {
  
  createButton.backgroundColor = UIColor.silver
  createButton.setTitle("Create", for: .normal)

  createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
  view.addSubview(createButton)

  createButton.snp.makeConstraints = { make in 
          make.leading.equalToSuperview().offset(62)
          make.top.equalToSuperview().offset(700)
          make.trailing.equalToSuperview().offset(-62)
          make.bottom.equalToSuperview().offset(-69)
        }
  }
  

  // MARK: - Button Actions
  @objc private func createButtonTapped() {
    let displayFoldersVC = DisplayFoldersVC(newFolder : name, delegate : self) 
    navigationController?.pushViewController(displayFoldersVC, animated: true)
    delegate?.addNewFolder(newFolder : name)
  }

}

extension FinalCreateVC: SetFolderName {

  func setName(name : text) {
    self.name = name
    folderLabel.text = name
  }

}