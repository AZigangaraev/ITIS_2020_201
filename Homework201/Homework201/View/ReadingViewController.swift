//
//  ReadingViewController.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol ReadingView: AnyObject {
    func setTitle(title: String)
    func setText(text: String)
}

class ReadingViewController: UIViewController, ReadingView {
    var presenter: ReadingPresenter?
    private var text: String!
    
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setText(text: String) {
        self.text = text
    }
}
