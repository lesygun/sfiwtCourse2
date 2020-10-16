//
//  PhotosCollectionViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    var friendID = Int()
    var friendPhotos = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photosTry = PhotoService()
        
        photosTry.getPhotos(id: friendID, callback: {result in
            
            self.friendPhotos = result.items
            self.collectionView.reloadData()
        })
        self.collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friendPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhotoCollectionViewCellKey", for: indexPath) as! PhotoCollectionViewCell
    
        let friendPhotoUrl = friendPhotos[indexPath.row].sizes[2].url
        let url = NSURL(string: friendPhotoUrl)
        cell.friendPhoto.load(url: url as! URL)
        
        //cell.friendPhoto = UIImageView.init(image: UIImage.init(named: friendPhotoKey!) )
    
        return cell
    }
}
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let GalleryController = segue.destination as? GalleryViewController{
//            GalleryController.photoArray = friendPhotos[0].url
//            }
//        }
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */



