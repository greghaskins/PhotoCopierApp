import UIKit
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func copyButtonTapped(sender: UIButton) {
        
        // Spike implementation, copying the most recent photo
        
        PHPhotoLibrary.requestAuthorization({status in
            
            if status == PHAuthorizationStatus.Authorized {
        
                let asset = self.fetchMostRecentPhotoFromCameraRoll()
                
                let manager = PHImageManager.defaultManager()
                manager.requestImageDataForAsset(asset, options: PHImageRequestOptions()) {
                    (imageData: NSData!, dataUTI: String!, orientation: UIImageOrientation, info: [NSObject : AnyObject]!) in
                    
                    PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                        let image = UIImage(data: imageData)
                        let creationRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
                        creationRequest.creationDate = asset.creationDate
                        
                        }, completionHandler: { (success: Bool, error: NSError!) in
                            println("success = \(success)")
                    })
                    
                }
            }
        });
        
    }
    
    func fetchMostRecentPhotoFromCameraRoll() -> PHAsset {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        let fetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions)
        let asset: PHAsset = fetchResult.lastObject as PHAsset
        return asset
    }


}

