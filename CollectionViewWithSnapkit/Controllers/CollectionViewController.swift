import UIKit
import SnapKit

class CollectionViewController: UIViewController {
    
    var brands = [Brand]()
    var customCell = "CustomCollectionViewCell"
    
    var layout : UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: customCell)
        collectionView.backgroundColor = .red
        collectionView.isScrollEnabled = true
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        createBrands()
    }
    
    
    func createBrands() {
        brands.append(Brand(brandName: "Brand 1", brandLogo: UIImage(named: "img1")))
        brands.append(Brand(brandName: "Brand 2", brandLogo: UIImage(named: "img2")))
        brands.append(Brand(brandName: "Brand 3", brandLogo: UIImage(named: "img3")))
        brands.append(Brand(brandName: "Brand 4", brandLogo: UIImage(named: "img4")))
    }
}



extension CollectionViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCell, for: indexPath) as! CustomCollectionViewCell
        
        // Configure the cell
        cell.backgroundColor = .white
        let brand = brands[indexPath.row]
        cell.label.text = brand.brandName
        cell.imageView.image = brand.brandLogo
        
        // return the cell
        return cell
    }
    
    
    
}
