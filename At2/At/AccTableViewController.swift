//
//  AccViewController.swift
//  At
//
//  Created by sungje on 2017. 8. 16..
//  Copyright © 2017년 sungje Park. All rights reserved.
//

import UIKit

class AccTableViewController: UIViewController {
    var data = ["a", "b", "c", "d", "e", "f"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func tableView(_tableView:UITableView, numberofRowsinSection section: Int) -> Int{
        return data.count
    }//cell의 개수 return
    
    func tableView(_tableView:UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = UITableViewCell()
        //let item = data[ indexPath.row ]
        return cell
    }//cell data return
    
    func tableView(_tableView:UITableView, acessoryButtonTappedForWith indexPath:IndexPath ){
        
    }//어떤 cell 선택했는지
    
    func tableView(_tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        let row = indexPath.row
        print(row)
    }//cell 선택 이후의 동작*/
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
