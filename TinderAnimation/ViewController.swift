//
//  ViewController.swift
//  TinderAnimation
//
//  Created by Arslan Ali on 16/2/18.
//  Copyright © 2018 Arslan Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewsArray = [UIView]()
    var index:Int!
    let swipeback:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bring Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let button:UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitleColor(.black, for: .normal)
        but.setTitle("Move to Next", for: .normal)
        return but
    }()
    var divisor:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(containerView)
        view.addSubview(swipeback)
        view.addSubview(button)
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        swipeback.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swipeback.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:250).isActive = true
        swipeback.addTarget(self, action: #selector(resetButton), for: .touchUpInside)
        swipeback.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.topAnchor.constraint(equalTo: swipeback.bottomAnchor,constant:30).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        divisor = (view.frame.width / 2) / 0.61
        //var constant:CGFloat = 0.0
        
        for i in 0 ... 9{
            let tinderCard = UIView()
            tinderCard.translatesAutoresizingMaskIntoConstraints = false
            tinderCard.backgroundColor = randomColor()
            tinderCard.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:))))
            view.addSubview(tinderCard)
            tinderCard.tag = i
            tinderCard.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
            tinderCard.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
            tinderCard.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
            tinderCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
            viewsArray.append(tinderCard)
            
            //constant += 30
        }
        self.index = viewsArray.count - 1
        //print(self.view.center.x)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @objc func nextScreen(){
        present(SecondViewController(), animated: true, completion: nil)
    }
    @objc func resetButton(){
        
        self.index = self.index + 1
        if self.index <= self.viewsArray.count - 1{
            let card = self.viewsArray[self.index]
            print(card.tag)
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                card.transform = CGAffineTransform.identity
                card.alpha = 1
            }
        }else{
            self.index = self.index - 1
        }
        
    }

    @objc func panGesture(gesture:UIPanGestureRecognizer){
        
        let card = gesture.view
        let point = gesture.translation(in: self.view)
        UIView.animate(withDuration: 0.2) {
            card?.center = CGPoint(x: self.view.center.x + point.x, y: self.view.center.y + point.y)
        }

        
        let xFromCenter = (card?.center.x)! - view.center.x
        card?.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)

        let floatValue:CGFloat = 75
        if gesture.state == .ended{
            if (card?.center.x)! < floatValue{
                //move left
                self.index = self.index - 1
                UIView.animate(withDuration: 0.2) {
                    card?.center = CGPoint(x: (card?.center.x)! - 200, y: self.view.center.y + 75)
                    card?.alpha = 0
                }
                return
            }else if (card?.center.x)! > (view.frame.width - 75){
                //move right
                self.index = self.index - 1
                UIView.animate(withDuration: 0.2) {
                    card?.center = CGPoint(x: (card?.center.x)! + 200, y: self.view.center.y)
                    card?.alpha = 0
                }
                return
            }else if (card?.center.y)! < floatValue + 30.0{
                //move up
                self.index = self.index - 1
                UIView.animate(withDuration: 0.2) {
                    card?.center = CGPoint(x: (self.view?.center.x)!, y: (card?.center.y)! - 200)
                    card?.alpha = 0
                }
                return

            }
            UIView.animate(withDuration: 0.2) {
                card?.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                card?.transform = CGAffineTransform.identity
            }
        }
    }
    
    func randomColor()->UIColor{
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

