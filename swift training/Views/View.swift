//
//  ViewController.swift
//  swift training
//
//  Created by Josicleison on 27/08/22.
//

import UIKit

class View: UIViewController {
    
    let holyDiverLyrics = ["""
    Mmm hmm, yeah, yeah
    Holy diver
    You've been down too long in the midnight sea
    Oh, what's becoming of me?
    ""","""
    Ride the tiger
    You can see his stripes but you know he's clean
    Oh, don't you see what I mean?
    Gotta get away
    Holy diver, yeah
    ""","""
    Shiny diamonds
    Like the eyes of a cat in the black and blue
    Something is coming for you
    Look out
    ""","""
    Race for the morning
    You can hide in the sun 'till you see the light
    Oh, we will pray it's all right
    Gotta get away, get away
    ""","""
    Between the velvet lies
    There's a truth that's hard as steel, yeah
    The vision never dies
    Life's a never ending wheel, say
    ""","""
    Holy diver
    You're the star of the masquerade
    No need to look so afraid
    ""","""
    Jump, jump
    Jump on the tiger
    You can feel his heart but you know he's mean
    Some light can never be seen, yeah
    ""","""
    Holy diver
    You've been down too long in the midnight sea
    Oh, what's becoming of me?
    No, no
    ""","""
    Ride the tiger
    You can see his stripes but you know he's clean
    Oh, don't you see what I mean?
    Gotta get away, get away
    Gotta get away, get away
    ""","""
    Holy diver, sole survivor
    You're the one who's clean
    Holy diver, holy diver
    There's a cat in the blue coming after you
    Holy diver
    Oh holy diver, yeah
    Alright, get away, get away, get away
    Holy diver, holy diver, oh holy diver mmm hmm
    """]
    
    private let tigerView: UIImageView = {
        
        let tigerView = UIImageView()
        tigerView.image = appImages.tiger
        tigerView.clipsToBounds = true
        
        return tigerView
    }()
    
    private lazy var lyricsScrollView: UIScrollView = {
        
        let viewToScroll: UIView = {
            
            let lyricsStackView: UIStackView = {
                
                var views = [UIView]()
                
                for paragraph in holyDiverLyrics {
                    
                    views.append(createView(paragraph))
                }
                
                let lyricsStackView = UIStackView(arrangedSubviews: views)
                lyricsStackView.axis = .vertical
                lyricsStackView.spacing = view.frame.size.width/20
                
                return lyricsStackView
            }()
            
            let viewToScroll = UIView()
            viewToScroll.addSubview(lyricsStackView)
            viewToScroll.layer.cornerRadius = view.frame.size.width/20
            
            lyricsStackView.constraintTo(by: .top, toItem: viewToScroll)
            lyricsStackView.constraintTo(by: .leading, toItem: viewToScroll)
            lyricsStackView.constraintTo(by: .trailing, toItem: viewToScroll)
            lyricsStackView.constraintTo(by: .bottom, toItem: viewToScroll)
            
            return viewToScroll
        }()
        
        let lyricsScrollView = UIScrollView()
        lyricsScrollView.addSubview(viewToScroll)
        
        viewToScroll.constraintTo(by: .top, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .leading, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .trailing, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .bottom, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .width, toItem: lyricsScrollView.frameLayoutGuide)
        
        return lyricsScrollView
    }()

    override func viewDidLoad() {
        
        view.addSubviews([tigerView, lyricsScrollView])
        
        super.viewDidLoad()
        
        tigerView.constraintTo(by: .top, toItem: view.safeAreaLayoutGuide)
        tigerView.constraintTo(by: .leading, toItem: view.safeAreaLayoutGuide)
        tigerView.constraintTo(by: .trailing, toItem: view.safeAreaLayoutGuide)
        view.addConstraint(tigerView.heightAnchor.constraint(equalToConstant: view.frame.size.height/5))
        
        lyricsScrollView.constraintTo(by: .top, toItem: tigerView, relation: .outside, 20)
        lyricsScrollView.constraintTo(by: .leading, toItem: view.safeAreaLayoutGuide, 10)
        lyricsScrollView.constraintTo(by: .trailing, toItem: view.safeAreaLayoutGuide, -10)
        lyricsScrollView.constraintTo(by: .bottom, toItem: view.safeAreaLayoutGuide)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
    
    func createView(_ paragraph: String) -> UIView {
        
        let button = UIButton()
        button.setImage(appImages.chevronLeft, for: .normal)
        button.setImage(appImages.chevronRight, for: .selected)
        
        let label = UILabel()
        label.text = paragraph
        label.font = UIFont.systemFont(ofSize: view.frame.size.width/20,
                                       weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.backgroundColor = .black
        
        let labelStack = UIStackView(arrangedSubviews: [label])
        
        let view = UIView()
        view.addSubviews([labelStack, button])
        labelStack.fillSuperview()
        
        button.constraintTo(by: .top, toItem: view)
        button.constraintTo(by: .trailing, toItem: view)
        button.constraintTo(by: .bottom, toItem: view)
        
        let handler = {(action: UIAction) in
            
            label.isHidden = !label.isHidden
            button.isSelected = !button.isSelected
        }
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
//        button.addTarget(self, action: #selector(anyViewButton), for: .touchUpInside)
        
        return view
    }
    
//    @objc func anyViewButton(_ sender: UIButton) {
        
//        Esse codigo retira a view da stack e coloca de volta na stack
//
//        guard let lyricsStackView = sender.superview?.superview as? UIStackView else {return}
//
//        sender.superview?.removeFromSuperview()
//
//        lyricsStackView.addArrangedSubview(sender.superview ?? UIView())
//    }
}

