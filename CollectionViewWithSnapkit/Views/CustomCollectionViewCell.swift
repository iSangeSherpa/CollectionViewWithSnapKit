import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var label : UILabel = {
       var label = UILabel()
        label.text = "Custom Label"
        return label
    }()
    
    var imageView : UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: 
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
                
        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(10)
        }
        imageView.snp.makeConstraints { maker in
            maker.centerX.equalTo(label.snp.centerX)
            maker.top.equalTo(label.snp.bottom).offset(10)
            maker.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
