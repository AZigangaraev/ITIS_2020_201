//
//  CryptoViewController.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

class CryptoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cryptoCell", for: indexPath) as? CryptoCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        let info = cells[indexPath.item]
        cell.set(name1: info.name, price1: info.price, size: Int(view.bounds.width)/2, index: indexPath.item)
        return cell
    }
    
    var onFinish: (() -> Void)?
    
    private func finish() {
        UserDefaults.standard.removeObject(forKey: "name")
        onFinish?()
    }

    private var cells: [Cryp] = []
    private var viewModel: CryptoViewModel = CryptoViewModelImplementation()

    @IBOutlet weak private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.cryps = { [unowned self] in
            cells = $0
            collectionView.reloadData()
        }
        viewModel.loadData()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    


}
