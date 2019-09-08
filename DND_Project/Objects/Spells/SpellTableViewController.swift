//
//  SpellTableViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/1/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit

class SpellTableViewController: UITableViewController {
    var spellArray: [[String: Any]] = []
    var yellowColor: UIColor = #colorLiteral(red: 0.8900027198, green: 0.6713432928, blue: 0.1288759967, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControllers()
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
            self.spellArray = spellIndex
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SpellTableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let spellCell = tableView.dequeueReusableCell(withIdentifier: "SpellCell") as? SpellTableViewCell
        let spell = spellArray[indexPath.row]
        spellCell?.spellNameLabel.text = spell["name"] as? String
        guard let cell = spellCell else { return UITableViewCell() }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spellArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? DetailSpellViewController else { return }
        let spell = spellArray[indexPath.row]
        destinationVC.selectedSpell = spell
    }
    
    func initializeControllers() {
        // Setup the Large Titles
        navigationController?.navigationBar.prefersLargeTitles = true
        let font = UIFont.systemFont(ofSize: 36)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: yellowColor,
            .paragraphStyle: paragraphStyle
        ]
        let smallerFont = UIFont.systemFont(ofSize: 12)
        let smallerAttributes: [NSAttributedString.Key: Any] = [
            .font: smallerFont,
            .foregroundColor: yellowColor
        ]
        navigationController?.navigationBar.titleTextAttributes = smallerAttributes
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        
        // Setup the Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.setScopeBarButtonTitleTextAttributes(attributes, for: .normal)
        searchController.searchBar.placeholder = "Search Spells"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension SpellTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
