//
//  ChatLogViewController.swift
//  testApp
//
//  Created by Dev on 5/27/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ChatLogViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    var messages: [Message]?
    
    var matchUser: MatchUser? {
        didSet{
            navigationItem.title = matchUser?.name
            messages = matchUser?.message?.allObjects as? [Message]
            messages = messages?.sorted(by: { $0.date?.compare($1.date!) == .orderedAscending })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatLogMessageCell
        cell.messageTextView.text = messages?[indexPath.item].text
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

    

    
}


class ChatLogMessageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        self.backgroundColor = .orange
        setup()
    }
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = "Sample"
        return textView
    }()
    
    func setup(){
        self.addSubview(messageTextView)
        messageTextView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor)
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
