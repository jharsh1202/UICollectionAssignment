//
//  ViewController.swift
//  UICollectionAssignment
//
//  Created by Harshit Jain on 21/06/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStore.sharedInstance.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("workoing 1")
        var CollectionViewcell = UICollectionViewCell()
            if let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
                cell.collectionViewCellLabel.text = DataStore.sharedInstance.dataSource[indexPath.row]
                CollectionViewcell = cell
            }
        return CollectionViewcell
        }
}

