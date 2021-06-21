//
//  ViewController.swift
//  UICollectionAssignment
//
//  Created by Harshit Jain on 21/06/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellDataTextView: UITextView!
    var selectedData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStore.sharedInstance.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var CollectionViewcell = UICollectionViewCell()
            if let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
                cell.collectionViewCellLabel.text = DataStore.sharedInstance.dataSource[indexPath.row]
                CollectionViewcell = cell
            }
        return CollectionViewcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell: CollectionViewCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell{
            cell.isCellSelected = !cell.isCellSelected
            if cell.isCellSelected {
                cell.backgroundColor = .green
                if let cellData = cell.collectionViewCellLabel.text {
                    selectedData.append(cellData)
                }
            } else {
                cell.backgroundColor = .red
                if let index = selectedData.firstIndex(where: {$0 == cell.collectionViewCellLabel.text}){
                    selectedData.remove(at: index)
                }
            }
            
            cellDataTextView.text = selectedData.joined(separator: ", ")
        }

    }
}

