//
//  Folder VC.swift
//  
//
//  Created by Olivia Newfield on 12/1/23.
//

import Foundation
import SnapKit
import UIKit

class FolderVC: UIViewController {
  
  //MARK - Properties (view)
  
  private let folderButton = UIButton()
  private let setButton = UIButton()
   
    // MARK - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

      setupButtons()
  }

    // MARK - Set Up Views

    private func setupButtons() {

        folderButton.backgroundColor = UIColor.silver
        setButton.backgroundColor = UIColor.silver

        folderButton.setTitle("Create Folder", for: .normal)
        setButton.setTitle("Create Set", for: .normal)

        folderButton.addTarget(self, action: #selector(folderButtonTapped), for: .touchUpInside)
        setButton.addTarget(self, action: #selector(setButtonTapped), for: .touchUpInside)

        view.addSubview(folderButton)
        view.addSubview(setButton)

        folderButton.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(42)
          make.top.equalToSuperview().offset(280)
          make.trailing.equalToSuperview().offset(-52)
          make.bottom.equalToSuperview().offset(-469)
        }

        setButton.snp.makeConstraints = { make in
          make.leading.equalToSuperview().offset(42)
          make.top.equalToSuperview().offset(389)
          make.trailing.equalToSuperview().offset(-52)
          make.bottom.equalToSuperview().offset(-360)
        }
    }

    // MARK: - Button Actions

    @objc private func folderButtonTapped() {
      let createFolderVC = CreateFolderVC() 
      navigationController?.pushViewController(createFolderVC, animated: true)
    }

    @objc private func setButtonTapped() {
      let createSetVC = CreateSetVC() 
      navigationController?.pushViewController(createSetVC, animated: true)
    }

}