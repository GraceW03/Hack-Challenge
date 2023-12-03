import Foundation
import UIKit
import SnapKit

class CardCell : UICollectionViewCell {

  private let termName = UILabel()
  private let definition = UITextField()

  static let reuse : String = "CardCellReuse"

  override init(frame: CGRect) {
      super.init(frame: frame)
        
      backgroundColor = UIColor.white
        
      setupCard()
  }
    
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func configure(card : Card) {
      termName.text = card.term
      definition.text = card.definition
  }

  private func setupCell() {
        
        contentView.addSubview(termName)
        contentView.addSubview(definition)
        
        termName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-83)
            make.bottom.equalToSuperview().offset(-83)
            make.width.equalTo(223)
            make.width.equalTo(15)
        }
        
        definition.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.top.equalToSuperview().offset(51)
            make.trailing.equalToSuperview().offset(-19)
            make.bottom.equalToSuperview()
            make.width.equalTo(287)
        }
  }
}
