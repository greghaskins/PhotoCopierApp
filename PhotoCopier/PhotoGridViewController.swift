import UIKit

let NumberOfColumns = 4;

class PhotoGridViewController: UICollectionViewController {

    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("loaded photo grid view controller")
    }

}

extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
            let widthOfGaps = self.layout.minimumInteritemSpacing * CGFloat(NumberOfColumns - 1)
            let length = (self.collectionView!.bounds.width - widthOfGaps) / CGFloat(NumberOfColumns);
            return CGSize(width: length, height: length)
    }

}

extension PhotoGridViewController: UICollectionViewDataSource {

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
}
