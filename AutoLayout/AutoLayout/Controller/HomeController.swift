//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by jahidul islam on 2/8/24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var btnSubscribeNow: UIButton!
    @IBOutlet weak var viewSubscribeNow: UIView! {
        didSet {
            viewSubscribeNow.ApplyCorner(CornerRadius: 15.0, BorderWidth: 2, BorderColor: .black)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.btnSubscribeNow.addTarget(self, action: #selector(btnSubscribeNowTapped), for: .touchUpInside)
    }
    
    @IBAction func btnSubscribeNowTapped () {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeController") as? SubscribeController {
            //self.navigationController?.pushViewController(vc, animated: true)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
