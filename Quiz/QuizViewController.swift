//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!
    
    //----------------------------------
    var timer:NSTimer!
    @IBOutlet var yes: UIImageView!
    @IBOutlet var no: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.yes.hidden = true
        self.no.hidden = true
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["夏のオリンピック　2016年の開催地は？","東京","リオデジャネイロ","アトランタ",2])
        quizArray.append(["シマウマの鳴き声は？","ワンワン！","メェー！","ヒヒーン！",1])
        quizArray.append(["人間の血管を全て繋げるとおよそどれくらいの長さになる？","10km","1000km","10万km",3])
        quizArray.append(["毎年角が生え替わるのは？","シカ","ウシ","サイ",1])
        quizArray.append(["今何問目？？","3問目","4問目","5問目",3])
        quizArray.append(["問題文6","選択肢","選択肢2","選択肢3",2])

        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
       
        //↓これ！！◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎
       // random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as! NSString as String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as! NSString as String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)  correctAnswer " + String(correctAnswer))
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
            
            self.yes.hidden = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: "update", userInfo: nil, repeats: true)
           // NSThread.sleepForTimeInterval(1.0)
            //NSThread.sleepForTimeInterval(1.0)
           // self.yes.hidden = true
        }else{
            self.no.hidden = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: "update", userInfo: nil, repeats: true)
        }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            performSegueToResult()
        }
       // quizArray.removeAtIndex(random)
       // choiceQuiz()
    }
    
    func update() {
        self.yes.hidden = true
        self.no.hidden = true
        timer.invalidate();
        
        quizArray.removeAtIndex(random)
        choiceQuiz()

    }

    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


