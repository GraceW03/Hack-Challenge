//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
import UIKit
import SnapKit

class CreatePageVC: UIViewController {
    // MARK - Properties (view)
private let createFolder = UIButton()
private let createSet = UIButton()

// Add any missing properties here

// MARK - viewDidLoad
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    setupCreateFolder()
    setupCreateSet()
}

// MARK - Set Up Views

private func setupCreateFolder() {
    createFolder.setTitle("Create Folder", for: .normal)
    createFolder.setTitleColor(.white, for: .normal)
    createFolder.backgroundColor = .blue
    createFolder.addTarget(self, action: #selector(createFolderButtonTapped), for: .touchUpInside)
    view.addSubview(createFolder)

    createFolder.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(-40) 
        make.width.equalTo(200)
        make.height.equalTo(40)
    }
}

private func setupCreateSet() {
    createSet.setTitle("Create Set", for: .normal)
    createSet.setTitleColor(.white, for: .normal)
    createSet.backgroundColor = .green
    createSet.addTarget(self, action: #selector(createSetButtonTapped), for: .touchUpInside)
    view.addSubview(createSet)

    createSet.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(40) // Adjust the offset as needed
        make.width.equalTo(200)
        make.height.equalTo(40)
    }
}
}
// MARK: - Button Actions

@objc private func createFolderButtonTapped() {
    
    let createFolderVC = CreateFolderViewController() 
    navigationController?.pushViewController(createFolderVC, animated: true)
}

@objc private func createSetButtonTapped() {
   
    let createSetVC = CreateSetViewController() 
    navigationController?.pushViewController(createSetVC, animated: true)
}
