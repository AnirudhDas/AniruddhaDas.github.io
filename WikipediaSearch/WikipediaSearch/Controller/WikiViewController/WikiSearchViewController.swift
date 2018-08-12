//
//  WikiSearchViewController.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SafariServices

class WikiSearchViewController: BaseViewController {

    @IBOutlet weak var wikiSearchBar: UISearchBar!
    @IBOutlet weak var wikiResultsTableView: UITableView!
    //Dependency Injected from Storyboard
    @IBOutlet weak var wikiViewModel: WikiViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
        
        wikiViewModel.reloadWikiTableView = {
            performUIUpdatesOnMain {
                self.wikiResultsTableView.reloadData()
            }
        }
    }
    
    func setupView()  {
        setNavigationTitle(title: Constants.homeNavTitle)
        wikiResultsTableView.dataSource = self
        wikiResultsTableView.delegate = self
        wikiResultsTableView.tableFooterView = UIView()
        wikiResultsTableView.allowsSelection = true
        wikiSearchBar.delegate = self
        wikiSearchBar.showsSearchResultsButton = false
        wikiSearchBar.autocorrectionType = .no
        wikiSearchBar.returnKeyType = .default
    }
    
    func showWikiPage(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}

extension WikiSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wikiViewModel?.wikiResultsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let wikiCell = tableView.dequeueReusableCell(withIdentifier: Constants.wikiTableViewCell, for: indexPath) as? WikiTableViewCell else {
            return UITableViewCell()
        }
        
        wikiCell.configureResultCell(wikiResult: wikiViewModel.wikiResultsArray[indexPath.row])
        wikiCell.accessoryType = .disclosureIndicator
        wikiCell.selectionStyle = .none
        return wikiCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let wikiCell = tableView.cellForRow(at: indexPath) as? WikiTableViewCell, let title = wikiCell.titleLbl.text, let urlString = Utility.addURLEncoding(ServerConfiguration.getWikiPageUrl(title: title)), let url = URL(string: urlString), let wikiResult = wikiCell.wikiResult else {
            return
        }
        wikiSearchBar.resignFirstResponder()
        showWikiPage(url: url)
        SessionManager.addRecentSearch(searchResult: wikiResult)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        wikiSearchBar.resignFirstResponder()
    }
}

extension WikiSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //To limit network activity, reload half a second after last key press.
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(getResults), object: nil)
        self.perform(#selector(getResults), with: nil, afterDelay: 0.5)
    }
    
    @objc func getResults() {
        guard Utility.isNetworkAvailable() else {
            networkDrop()
            return
        }
        wikiViewModel.fetchWikiResults(filter: wikiSearchBar.text ?? "")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
