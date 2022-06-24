//
//  BookedViewController.swift
//  DTCab
//
//  Created by Sulaiman on 14/06/22.
//

import UIKit

class BookedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var dashView : UIView!
    @IBOutlet weak var bookedtableView : UITableView!
    @IBOutlet weak var btnBack : UIButton!
    @IBOutlet weak var btnCancel : UIButton!
    @IBOutlet weak var lblTitle : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCorners()
        dashView.createDottedLine(width: 1.0, color: UIColor.black.cgColor)
        btnBack.setTitle("", for: .normal)
       
        btnCancel.setTitle("", for: .normal)
        bookedtableView.delegate = self
        bookedtableView.dataSource = self
    }
    func makeCorners(){
        dashView.layer.cornerRadius = 10.00
        btnCancel.layer.cornerRadius = 5.00
        lblTitle.layer.cornerRadius = lblTitle.frame.size.height/2
        lblTitle.clipsToBounds = true
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookedtableView.dequeueReusableCell(withIdentifier: "BookedTableViewCell", for: indexPath) as! BookedTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
        
    }

    
}
extension UIView {
   func createDottedLine(width: CGFloat, color: CGColor) {
      let caShapeLayer = CAShapeLayer()
      caShapeLayer.strokeColor = color
      caShapeLayer.lineWidth = width
      caShapeLayer.lineDashPattern = [8]
      let cgPath = CGMutablePath()
      let cgPoint = [CGPoint(x: 0, y: 150), CGPoint(x: self.frame.width, y: 150)]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
      layer.addSublayer(caShapeLayer)
   }
}

class BookedTableViewCell : UITableViewCell{
    
}
