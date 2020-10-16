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
    var friendPhotos = [PhotoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photosTry = PhotoService()
        
        photosTry.getPhotos(id: friendID, callback: {result in
            
            self.friendPhotos = result
            self.collectionView.reloadData()
        })
        self.collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return friendPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhotoCollectionViewCellKey", for: indexPath) as! PhotoCollectionViewCell
    
        let friendPhotoUrl = friendPhotos[indexPath.row].sizes[2].url
        let url = NSURL(string: friendPhotoUrl)
        cell.friendPhoto.load(url: url! as URL)
    
        return cell
    }
}
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let GalleryController = segue.destination as? GalleryViewController{
//            GalleryController.photoArray = friendPhotos[0].url
//            }
//        }
//    }




