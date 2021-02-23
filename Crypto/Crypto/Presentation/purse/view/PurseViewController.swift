//
//  PurseViewController.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

class PurseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "purseCell", for: indexPath) as? CryptoTableViewCell else {
            fatalError("Could not dequeue cell")
        }
        let purs = cells[indexPath.row]
        cell.set(name1: purs.cryp.name, quantity1: purs.quality)
        return cell
    }
    
    var onFinish: (() -> Void)?
    
    private func finish() {
        UserDefaults.standard.removeObject(forKey: "name")
        onFinish?()
    }
    
    
    private var cells: [Purse] = []
    private var viewModel: PurseViewModel = PurseViewModelImplementation()

    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("work10")
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width:  view.bounds.width, height: view.bounds.height)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "purseCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        viewModel.purses = { [unowned self] in
            cells = $0
            tableView.reloadData()
        }
        viewModel.loadData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    


}
