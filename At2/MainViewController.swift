//
//  MainViewController.swift
//  At
//
//  Created by sungje on 2017. 8. 16..
//  Copyright © 2017년 sungje Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate {

    
    @IBOutlet weak var pickerCity: UIPickerView!
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblDegree: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblCity: UILabel!
    let max = 10
    let pickerViewColumn = 1
    var pickerName = ["Seoul", "Gangneung", "Chuncheon"]
    var degree: Int!
    var condition: String!
    var imgURL: String!
    var city: String!
    var exists: Bool = true
    
    let url1 = URL(string: "https://www.pyeongchang2018.com/en/index")
    let url2 = URL(string: "http://eng.pc.go.kr")

    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let urlRequest = URLRequest(url: URL(string: "http://api.apixu.com/v1/current.json?key=55b6124e53c944d5880105844172708&q=\(pickerName[0])")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let current = json["current"] as? [String : AnyObject] {
                        if let temp = current["temp_c"] as? Int {
                            self.degree = temp
                        }
                        if let condition = current["condition"] as? [String : AnyObject] {
                            self.condition = condition["text"] as! String
                            let icon = condition["icon"] as! String
                            self.imgURL = "http:\(icon)"
                        }
                    }
                    
                    if let location = json["location"] as? [String : AnyObject] {
                        self.city = location["name"] as! String
                    }
                    
                    if let _ = json["error"] {
                        self.exists = false
                    }
                    
                    DispatchQueue.main.async {
                        if self.exists{
                            self.lblCity.text = self.city
                            self.lblDegree.text = self.degree.description
                            self.lblDegree.text?.append(" ℃")
                            self.lblCondition.text = self.condition
                            self.imgView.downloadImage(from: self.imgURL!)
                        } else {
                            self.lblDegree.isHidden = true
                            self.lblCondition.isHidden = true
                            self.imgView.isHidden = true
                            self.exists = true
                        }
                    }
                    
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }
        task.resume()
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
    
    
    /*
    func numberOfComponentsInPickeView(pickerView: UIPickerView!) -> Int {
        return pickerViewColumn
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return pickerName.count
    }*/
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewColumn
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let urlRequest = URLRequest(url: URL(string: "http://api.apixu.com/v1/current.json?key=55b6124e53c944d5880105844172708&q=\(pickerName[row])")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let current = json["current"] as? [String : AnyObject] {
                        if let temp = current["temp_c"] as? Int {
                            self.degree = temp
                        }
                        if let condition = current["condition"] as? [String : AnyObject] {
                            self.condition = condition["text"] as! String
                            let icon = condition["icon"] as! String
                            self.imgURL = "http:\(icon)"
                        }
                    }
                    
                    if let location = json["location"] as? [String : AnyObject] {
                        self.city = location["name"] as! String
                    }
                    
                    if let _ = json["error"] {
                        self.exists = false
                    }
                    
                    DispatchQueue.main.async {
                        if self.exists{
                            self.lblDegree.isHidden = false
                            self.lblCondition.isHidden = false
                            self.imgView.isHidden = false
                            self.lblCity.text = self.city
                            self.lblDegree.text = self.degree.description
                            self.lblDegree.text?.append(" ℃")
                            self.lblCondition.text = self.condition
                            self.imgView.downloadImage(from: self.imgURL!)
                        } else {
                            self.lblDegree.isHidden = true
                            self.lblCondition.isHidden = true
                            self.imgView.isHidden = true
                            self.exists = true
                        }
                    }
                    
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    
    
    @IBAction func btnPCOfficial(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url1!) {
            UIApplication.shared.open(url1!, options: [:], completionHandler: nil)
        }
    }

    @IBAction func btnPCTourist(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(url2!) {
            UIApplication.shared.open(url2!, options: [:], completionHandler: nil)
        }
    }
   
}

extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
}
