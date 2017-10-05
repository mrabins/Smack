//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Mark Rabins on 10/5/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    @IBOutlet weak var segementControl: UISegmentedControl!
    
    // MARK: Variables
    var avatarType = AvatarType.dark
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self

    }

    @IBAction func segementControlChanged(_ sender: Any) {
        if segementControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        avatarCollectionView.reloadData()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension AvatarPickerVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numsOfColumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numsOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((avatarCollectionView.bounds.width - padding) - (numsOfColumns - 1) * spaceBetweenCells) / numsOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
