//
//  ViewController.swift
//  Quizz-iOS
//
//  Created by Ayush Rajpal on 18/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var question_lable: UILabel!
    @IBOutlet weak var progress_barr: UIProgressView!
    @IBOutlet weak var false_buttom: UIButton!
    @IBOutlet weak var true_button: UIButton!
    
    var quizBrain = Quiz_brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answer_button_pressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotRight = quizBrain.checkAnswer(userAnswer!)
       
        
        if userGotRight{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
     
    }
    
    @objc func updateUI(){
        question_lable.text = quizBrain.getQuestionText()
        true_button.backgroundColor = UIColor.clear
        false_buttom.backgroundColor = UIColor.clear
        progress_barr.progress = quizBrain.getProgress()
    }
}

