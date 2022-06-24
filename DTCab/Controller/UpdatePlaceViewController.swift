//
//  UpdatePlaceViewController.swift
//  DTCab
//
//  Created by Sulaiman on 18/06/22.
//

import UIKit

class UpdatePlaceViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var btnPickMap : UIButton!
    @IBOutlet weak var btnBack : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    @IBAction func btnGoMap(_sender : UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SetDestinationViewController") as! SetDestinationViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnNavBack(_sender : UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyFavouriteViewController") as! MyFavouriteViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "UpdatePlaceCollectionViewCell", for: indexPath) as! UpdatePlaceCollectionViewCell
        cell.backgroundColor = .clear
        cell.lblTitle.text = "work"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120.0, height: 50.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
  
}
class UpdatePlaceCollectionViewCell : UICollectionViewCell{
    @IBOutlet weak  var viewContent  : UIView!
    @IBOutlet weak  var imgIcon : UIImageView!
    @IBOutlet weak  var lblTitle : UILabel!
    
}
