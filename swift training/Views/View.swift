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
        
        return tigerView
    }()
    
    private let lyricsScrollView: UIScrollView = {
        
        let viewToScroll: UIView = {
            
            let lyricsStackView: UIStackView = {
                
                let lyricsStackView = UIStackView()
                lyricsStackView.backgroundColor = .red
                return lyricsStackView
            }()
            
            let viewToScroll = UIView()
            viewToScroll.addSubview(lyricsStackView)
            viewToScroll.backgroundColor = .green
            
            lyricsStackView.constraintTo(by: .top, toItem: viewToScroll, 20)
            lyricsStackView.constraintTo(by: .leading, toItem: viewToScroll, 20)
            lyricsStackView.constraintTo(by: .trailing, toItem: viewToScroll, -20)
            lyricsStackView.constraintTo(by: .height, toItem: viewToScroll, multiplier: 0.5)
            
            return viewToScroll
        }()
        
        let lyricsScrollView = UIScrollView()
        lyricsScrollView.addSubview(viewToScroll)
        
        viewToScroll.constraintTo(by: .top, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .leading, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .trailing, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .bottom, toItem: lyricsScrollView.contentLayoutGuide)
        viewToScroll.constraintTo(by: .width, toItem: lyricsScrollView.frameLayoutGuide)
        viewToScroll.constraintTo(by: .height, toItem: lyricsScrollView, multiplier: 5)
        
        return lyricsScrollView
    }()

    override func viewDidLoad() {
        
        view.addSubViews([tigerView, lyricsScrollView])
        
        super.viewDidLoad()
        
        tigerView.constraintTo(by: .top, toItem: view.safeAreaLayoutGuide)
        tigerView.constraintTo(by: .leading, toItem: view.safeAreaLayoutGuide)
        tigerView.constraintTo(by: .trailing, toItem: view.safeAreaLayoutGuide)
        view.addConstraint(tigerView.heightAnchor.constraint(equalToConstant: view.frame.size.height/5))
        
        lyricsScrollView.constraintTo(by: .top, toItem: tigerView, relation: .outside, 10)
        lyricsScrollView.constraintTo(by: .leading, toItem: view.safeAreaLayoutGuide, 10)
        lyricsScrollView.constraintTo(by: .trailing, toItem: view.safeAreaLayoutGuide, -10)
        lyricsScrollView.constraintTo(by: .bottom, toItem: view.safeAreaLayoutGuide)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
}

