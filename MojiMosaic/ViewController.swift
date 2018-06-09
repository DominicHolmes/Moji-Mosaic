//
//  ViewController.swift
//  MojiMosaic
//
//  Created by dominic on 6/8/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emojiCollection: [String] = {
        var emojis = [String]()
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        for range in emojiRanges {
            for i in range {
                var c = String(UnicodeScalar(i)!)
                emojis.append(c)
            }
        }
        return emojis
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath)
        guard let label = cell.viewWithTag(100) as? UILabel else { return cell }
        label.text = emojiCollection[indexPath.row]
        return cell
    }
}

