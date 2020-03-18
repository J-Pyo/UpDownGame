//
//  ViewController.swift
//  Updown
//
//  Created by 홍정표 on 2020/03/09.
//  Copyright © 2020 홍정표. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Mark - properties
    //Mark - IBOutlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var turnCountLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    //Mark - stored properties
    
    var randomNumber: UInt32 = 0
    var turnCount:Int = 0
    
    //Mark - Methods
    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        
        guard let inputText = self.inputField.text,
            inputText.isEmpty == false else{
                print("입력값 없음")
                return
        }
        guard let inputNumber: UInt32 = UInt32(inputText) else{
            print("입력값이 잘못 되었습니다")
            return
        }
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber{
            resultLabel.text = "Down"
        }else if inputNumber < randomNumber{
            resultLabel.text = "Up"
        }else if inputNumber == randomNumber{
            resultLabel.text = "정답!"
        }
        
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        self.initializeGame()
    }
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        //빈 화면 터치시 키패드 내려감
        self.inputField.resignFirstResponder()
    }
    //Mark - Custom Method
    func initializeGame(){
        
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("임의의 숫자 : \(self.randomNumber)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeGame()
    }


}

