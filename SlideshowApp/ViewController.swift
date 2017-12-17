//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 櫻井 謙充 on 2017/12/03.
//  Copyright © 2017年 vansocia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var gobutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var slideshow: UIButton!
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    // 画像の名前の配列
    let imageNameArray = [
        "cat1",
        "cat2",
        "cat3",
        "cat4",
        "dog1",
        "dog2",
        ]

    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        if dispImageNo == imageNameArray.count - 1 {
            dispImageNo = 0
        } else if dispImageNo < 0 {
            dispImageNo = 5
        }

        
        
        
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        dispImageNo += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "cat1")
        print(image!)
        
        imageView.image = image
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startTimer(_ sender: Any) {
        //進むボタンをタップした時の処理
        if dispImageNo == 5 {
            dispImageNo = 0
        }else{
            dispImageNo += 1
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    //IBアウトレットを紐づける
    
    @IBAction func backTimer(_ sender: Any) {
        //戻るボタンをタップした時の処理
        if dispImageNo == 0 {
            dispImageNo = 5
        }else{
            dispImageNo -= 1
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
   
    

    
    @IBAction func startstopTimer(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayImage), userInfo: nil, repeats: true)
            
            // スライドショーの自動送りが進んでいる間、3つのボタンの挙動を変える
            gobutton.isEnabled = false
            backbutton.isEnabled = false
            slideshow.setTitle("停止", for: .normal)
            
        } else if self.timer != nil {
            self.timer?.invalidate()
           self.timer = nil
            gobutton.isEnabled = true
            backbutton.isEnabled = true
            slideshow.setTitle("再生", for: .normal)
            
            
        }
        
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
        }
        
    

        
        }
    
    
    

