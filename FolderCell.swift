import Foundation
import UIKit
import SnapKit

class FolderCell : UICollectionViewCell {

  private let folderImage = UIImageView(image: UIImage(named: foldericon))
  private let folderName = UILabel()

  static let reuse : String = "FolderCellReuse"

  override init(frame: CGRect) {
      super.init(frame: frame)
        
      backgroundColor = UIColor.white
        
      setupView()
  }
    
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func configure(folder : Folder) {
      folderLabel.text = folder.name
  }

  private func setupView() {
        
        contentView.addSubview(folderLabel)
        contentView.addSubview(folderImage)
        
        folderImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-45)
            make.width.equalTo(112)
        }
        
        folderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalTo(folderImage.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-25)
            make.bottom.equalToSuperView()
            make.height.equalTo(40)
        }
   
  }



}