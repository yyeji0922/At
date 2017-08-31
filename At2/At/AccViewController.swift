//
//  AccViewController.swift
//  At
//
//  Created by sungje on 2017. 8. 16..
//  Copyright © 2017년 sungje Park. All rights reserved.
//

import UIKit

class AccViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var search_button: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //acc_search.showsSearchResultsButton = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var isSearching = false
    var searchResult = ["a", "b", "c", "d", "e", "f"]
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if isSearching { return searchResult.count }
        else { return allData.count }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchResult.removeAll() // 기존 결과 지우기 
        isSearching = true
        // 검색, 테이블 뷰 갱신 
    }
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text!
        searchResult.removeAll()
        searchItem(keyword)
        tableView.reloadData()
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
