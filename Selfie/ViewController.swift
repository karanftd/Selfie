//
//  ViewController.swift
//  Selfie
//
//  Created by einfochips on 28/11/16.
//  Copyright © 2016 KaranFtd. All rights reserved.
//

import UIKit
import TGCameraViewController

class ViewController: UIViewController, TGCameraDelegate {
    
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        photoView.clipsToBounds = true
        
        let clearButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(clearTapped))
        navigationItem.rightBarButtonItem = clearButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TGCameraDelegate - Required methods
    
    func cameraDidCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func cameraDidTakePhoto(_ image: UIImage!) {
        photoView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func cameraDidSelectAlbumPhoto(_ image: UIImage!) {
        photoView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: TGCameraDelegate - Optional methods
    
    func cameraWillTakePhoto() {
        print("cameraWillTakePhoto")
    }
    
    func cameraDidSavePhoto(atPath assetURL: URL!) {
        print("cameraDidSavePhotoAtPath: \(assetURL)")
    }
    
    func cameraDidSavePhotoWithError(_ error: Error!) {
        print("cameraDidSavePhotoWithError \(error)")
    }
    
    
    @IBAction func photobtnClicked(_ sender: UIButton) {
        
        let navigationController = TGCameraNavigationController.new(with: self)
        present(navigationController!, animated: true, completion: nil)
    }
    // MARK: Actions
    
//    @IBAction func takePhotoTapped() {
//        let navigationController = TGCameraNavigationController.new(with: self)
//        present(navigationController!, animated: true, completion: nil)
//    }
    
    
    // MARK: Private methods
    
    func clearTapped() {
        photoView.image = nil
    }



}

