//
//  ViewController.swift
//  ContactAppMVVM
//
//  Created by Rishat on 22.02.2021.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    func logOut() {
        onFinish?()
    }
    
    var onFinish: (() -> Void)?
    
    func push() {
        toNext?()
    }
    
    var toNext: (() -> Void)?

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var zoomImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(logOutTap))
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomImage
    }
    
    @IBAction func nextView(_ sender: Any) {
        push()
    }
    
    @objc private func logOutTap() {
        logOut()
    }
}
