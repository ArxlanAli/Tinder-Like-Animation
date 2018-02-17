//
//  SecondViewController.swift
//  TinderAnimation
//
//  Created by Arslan Ali on 17/2/18.
//  Copyright © 2018 Arslan Ali. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{

  
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "iMac-Pro-Wallpaper-2767-x-1556-AR72014")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let imageView1:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "iMac-Pro-Wallpaper-2767-x-1556-AR72014")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let button:UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitleColor(.black, for: .normal)
        but.setTitle("up", for: .normal)
        return but
    }()
    
    let button1:UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitleColor(.black, for: .normal)
        but.setTitle("Back", for: .normal)
        return but
    }()
    
    let bottomView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(imageView1)
        view.addSubview(button)
        view.addSubview(button1)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        imageView1.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant:10).isActive = true
        imageView1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        button.topAnchor.constraint(equalTo: imageView1.bottomAnchor,constant:30).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.addTarget(self, action: #selector(upAction), for: .touchUpInside)
        
        button1.topAnchor.constraint(equalTo: button.bottomAnchor,constant:30).isActive = true
        button1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button1.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        
        
        
        let views = self.view.subviews
        for view in views{
            view.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.size.height)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func upAction(){
        var delayCounter = 0
        let views = self.view.subviews
        for view in views{
            
            UIView.animate(withDuration: 1.0, delay: Double (delayCounter ) *  0.1 , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut , animations: {
                view.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.size.height)
                view.alpha = 1
            }, completion: nil)
            
            delayCounter += 1
        }
        view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: view.topAnchor,constant:100).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        UIView.animate(withDuration: 1.0, delay: Double (0.1) , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut , animations: {
            self.bottomView.transform = CGAffineTransform.identity
            self.bottomView.alpha = 1
        }, completion: nil)
        
    
    }
    
    func animate(){
        let views = self.view.subviews

        var delayCounter = 0
        
        for view in views{
            UIView.animate(withDuration: 1.0, delay: Double (delayCounter ) *  0.2 , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut , animations: {
                view.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delayCounter += 1
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.animate()
    }
    
   
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
