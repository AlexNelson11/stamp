//
//  ViewController.swift
//  Stamp
//
//  Created by Alex Nelson on 12/16/15.
//  Copyright © 2015 Alex Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    var imageNameArray: [String] = ["hana","hoshi","IMG_3145.jpg","shitumon"]
    
    var imageIndex: Int = 0
    
    @IBOutlet var haikeiImageView: UIImageView!
    
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectedFirst() {
        imageIndex = 1
    }
    @IBAction func selectedSecond() {
        imageIndex = 2
    }
    @IBAction func selectedThird() {
        imageIndex = 3
    }
    @IBAction func selectedFourth() {
        imageIndex = 4
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = (touches.first)!
        let location:CGPoint = touch.locationInView(self.view)
        
        if imageIndex != 0 {
            
            imageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
            
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
        imageView.center = CGPointMake(location.x, location.y)
        
        self.view.addSubview(imageView)
        
        }
        
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectBackground() {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func save() {
        
        let rect: CGRect = CGRectMake(0, 30, 320, 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,didFinshPickingMediaWithInfo info: [String : AnyObject]) {
        print("aaa")
        
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        haikeiImageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

