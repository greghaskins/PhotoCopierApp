import UIKit

class PhotoGridViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("loaded photo grid view controller")
    }

}

extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let length = (self.collectionView!.bounds.width - 30) / 4.0;
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
