//
//  MoreViewController.swift
//  At
//
//  Created by sungje on 2017. 8. 16..
//  Copyright © 2017년 sungje Park. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    
    let url1 = URL(string: "itms-apps://itunes.apple.com/us/app/%EB%84%A4%EC%9D%B4%EB%B2%84-%EC%A7%80%EB%8F%84-naver-map/id311867728?mt=8")
    
    let url2 = URL(string: "itms-apps://itunes.apple.com/us/app/google-translate/id414706506?mt=8")
    
    let url3 = URL(string: "itms-apps://itunes.apple.com/us/app/kakaotalk/id362057947?mt=8")
    
    let url4 = URL(string: "itms-apps://itunes.apple.com/us/app/kakaotaxi/id981110422?mt=8")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

     */
    @IBAction func btnNaverMaps(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url1!) {
            UIApplication.shared.open(url1!, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnGoogleMaps(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url2!) {
            UIApplication.shared.open(url2!, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnKakaoTalk(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url3!) {
            UIApplication.shared.open(url3!, options: [:], completionHandler: nil)
        }
    }
    @IBAction func btnKakaoTaxi(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url4!) {
            UIApplication.shared.open(url4!, options: [:], completionHandler: nil)
        }
    }

}
