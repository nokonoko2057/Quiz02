//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
     var correctAnswer:Int = 0
    
     @IBOutlet var label:UILabel!
    
    //label.text="正解数String(correctAnswer)";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text="5問中"+String(correctAnswer)+"問正解!";

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
