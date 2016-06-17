//
//  ViewController.swift
//  FrameDemo
//
//  Created by 高永效 on 16/6/17.
//  Copyright © 2016年 EgeTart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageTableView: UITableView!
    
    var resizableImage: UIImage!
    
    var heightOfRows = [CGFloat]()
    
    let englishSentence: NSString = "He ran up stairs. Then in a little while, Paul heard him coming back, but he was not coming fast. He was carrying his little crippled brother. He set him down on the bottom step. Then a sort of squeezed up against him and pointed to the car. There she is, buddy, just like I told you upstairs. His brother gave it to him for Christmas and didn't cost hime a cent. And some day, I'm gonna give you one just like it. Then you can see for yourself all the prettiest things in the windows that I was trying to tell you about."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...20 {
            heightOfRows.append(CGFloat(random() % 200 + 100))
        }
    
        let frame = UIImage(named: "frame")!
        let frameSize = frame.size
        
        print(frameSize)
        
        let yRemider = (frameSize.height - 20.0) / 2.0
        let xRemider = (frameSize.width - 40.0) / 2.0
        
        resizableImage = frame.resizableImageWithCapInsets(UIEdgeInsets(top: yRemider, left: xRemider, bottom: yRemider, right: xRemider))
        
        imageTableView.dataSource = self
        imageTableView.delegate = self
        imageTableView.tableFooterView = UIView()
        
        imageTableView.rowHeight = UITableViewAutomaticDimension
        imageTableView.estimatedRowHeight = 50.0
    }

    func getSubSentence() -> String {
        let length = englishSentence.length
        let subSentence = englishSentence.substringToIndex(random() % length)
        
        return subSentence
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath)
        let imageView = cell.viewWithTag(101) as! UIImageView
        imageView.image = resizableImage
        
        let sentenceLabel = cell.viewWithTag(102) as! UILabel
        sentenceLabel.attributedText = NSMutableAttributedString(string: getSubSentence())
        
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

