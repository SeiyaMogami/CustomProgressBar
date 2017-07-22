//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by 最上聖也 on 2017/07/22.
//  Copyright © 2017年 SeiyaMogami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var achivementBar: AchivementBar!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        achivementBar.achivementRate = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

