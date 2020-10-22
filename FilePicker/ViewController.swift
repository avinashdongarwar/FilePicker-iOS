//
//  ViewController.swift
//  FilePicker
//
//  Created by Avinash Dongarwar on 10/20/20.
//

import UIKit

class ViewController: UIViewController, FilePickerDelegate {

    var filePicker: FilePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filePicker = FilePicker(presentationController: self, delegate: self)
    }

    func didPickFiles(files: File?) {

    }

    func didCancelledPicker() {

    }

    @IBAction func pickPressed(_ sender: Any) {
        filePicker.present(from: view)
    }
}

