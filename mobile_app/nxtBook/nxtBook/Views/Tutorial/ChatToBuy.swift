//
//  ChatToBuy.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class ChatToBuy: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textBook: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont(name: "Futura-Medium", size: 38)
        label.textAlignment = .center
        label.text = "easily chat and pick a place to meet up."
        label.textColor = UIColor.white
        return label
    }()
    
    let chatBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 500))
        view.gradient.startPoint = CGPoint(x: 0.5 , y: 0.3)
        view.gradient.endPoint = CGPoint(x: 0.5, y: 0.7)
        return view
    }()
    
    let whiteChatView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 470))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let chat1 = TutorialChatBubble()
    
    let chat2: TutorialChatBubble = {
        let bubble = TutorialChatBubble()
        bubble.backgroundColor = Colors.messageGray
        bubble.message.textColor = UIColor.darkGray
        return bubble
    }()
    
    let chat3 = TutorialChatBubble()
    
    let chat4: TutorialChatBubble = {
        let bubble = TutorialChatBubble()
        bubble.backgroundColor = Colors.messageGray
        bubble.message.textColor = UIColor.darkGray
        return bubble
    }()
    
    func setupViews() {
        addSubview(textBook)
        textBook.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 40, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 160)
        
        addSubview(chatBackground)
        chatBackground.anchorCenterXToSuperview()
        chatBackground.anchor(textBook.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 500)
        
        chatBackground.addSubview(whiteChatView)
        whiteChatView.anchorCenterSuperview()
        whiteChatView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 320, heightConstant: 470)
        
        whiteChatView.addSubview(chat1)
        chat1.anchor(whiteChatView.topAnchor, left: nil, bottom: nil, right: whiteChatView.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 200, heightConstant: 60)
        chat1.message.text = "hey where would you like to meet?"
        
        whiteChatView.addSubview(chat2)
        chat2.anchor(chat1.bottomAnchor, left: whiteChatView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 60)
        chat2.message.text = "how about the quad at 4 today?"
        
        whiteChatView.addSubview(chat3)
        chat3.anchor(chat2.bottomAnchor, left: nil, bottom: nil, right: whiteChatView.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 200, heightConstant: 60)
        chat3.message.text = "sounds good! I’ll be wearing a purple shirt."
        
        whiteChatView.addSubview(chat4)
        chat4.anchor(chat3.bottomAnchor, left: whiteChatView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 60)
        chat4.message.text = "cool. I’ll be in a tan cowboy hat."
    }
}
