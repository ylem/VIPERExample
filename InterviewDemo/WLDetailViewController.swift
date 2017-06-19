//
//  WLDetailViewController.swift
//  InterviewDemo
//
//  Created by Wei Lu on 19/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dismissButton = UIButton(type: .custom)
        dismissButton.iconFont(name: "circle-down")
        view.addSubview(dismissButton)

        dismissButton.translatesAutoresizingMaskIntoConstraints                                        = false
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive      = true
        dismissButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 44).isActive                             = true
        dismissButton.heightAnchor.constraint(equalToConstant: 44).isActive                            = true
        dismissButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)


        let sleepLabel = UILabel()
        sleepLabel.iconFont(name: "sleepy")
        view.addSubview(sleepLabel)
        sleepLabel.sizeToFit()

        sleepLabel.translatesAutoresizingMaskIntoConstraints                                     = false
        sleepLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                = true
        sleepLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true

        let noteLabel           = UILabel()
        noteLabel.text          = "I need sleep, sorry cannot finish everything in one day."
        noteLabel.numberOfLines = 0
        noteLabel.textAlignment = .center
        view.addSubview(noteLabel)
        noteLabel.sizeToFit()

        noteLabel.translatesAutoresizingMaskIntoConstraints                                          = false
        noteLabel.centerYAnchor.constraint(equalTo: sleepLabel.centerYAnchor, constant: 50).isActive = true
        noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive       = true
        noteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive     = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismiss(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
