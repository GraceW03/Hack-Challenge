import Foundation
import UIKit
import SnapKit

class SetCell : UICollectionViewCell {

  private let setName = UILabel()
  private let termCount = UILabel()
  private let userPhoto = UIImageView()
  private let userName = UILabel(text: "Allyana")

  static let reuse : String = "SetCellReuse"

  override init(frame: CGRect) {
      super.init(frame: frame)
        
      backgroundColor = UIColor.white
        
      setupCell()
  }
    
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func configure(set : Category) {
      setName.text = set.name
      termCount.text = set.cards.count
  }

  private func setupCell() {
        userPhoto.layer.cornerRadius = 10
        layer.maskToBounds = true
        
        contentView.addSubview(setName)
        contentView.addSubview(termCount)
        contentView.addSubview(userPhoto)
        contentView.addSubview(userName)
        
        setName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-7)
            make.bottom.equalToSuperview().offset(-77)
            make.width.equalTo(315)
            make.width.equalTo(124)
        }
        
        termCount.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.top.equalToSuperview().offset(52)
            make.trailing.equalToSuperview().offset(-69)
            make.bottom.equalToSuperview().offset(-57)
            make.height.equalTo(15)
        }

        userPhoto.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(86)
            make.trailing.equalToSuperview().offset(-275)
            make.bottom.equalToSuperview().offset(-14)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }

        userName.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-45)
            make.width.equalTo(112)
        }
   
  }



}
