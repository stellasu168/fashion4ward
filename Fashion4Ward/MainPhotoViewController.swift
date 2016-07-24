//
//  MainPhotoViewController.swift
//  Fashion4ward
//
//  Created by Dianne Katrina Bronola on 7/23/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit

class MainPhotoViewController: UIViewController{
    
    @IBOutlet weak var mainImageView: UIImageView!
    let picNames = ["a", "b", "c", "d", "e", "f", "g"]
    var currentImage: String!
    
    @IBAction func nextImage(sender: UIButton) {
        generateRandomPic()
        
    }
    override func viewWillAppear(animated: Bool) {
        generateRandomPic()
    }
    
    
    @IBAction func addPhoto(sender: UIBarButtonItem) {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("PhotoEditorViewController") as! PhotoEditorViewController
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    
    
    @IBAction func ratePhoto(sender: UIButton) {
        //navigate to ratingphotoview
        let controller = storyboard!.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        print (currentImage)
        controller.imageName = currentImage
        self.navigationController!.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func addCategoryPage(sender: AnyObject) {
        print("rating button")
        let controller = storyboard!.instantiateViewControllerWithIdentifier("CategoryViewController") as! CategoryViewController
        self.navigationController!.pushViewController(controller, animated: true)
    }

/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ViewController
        controller.imageName = currentImage
    }
*/    
    
    func generateRandomPic() {
        let randomIndex = Int(arc4random_uniform(UInt32(picNames.count)))
        let currentImageName = picNames[randomIndex]
        currentImage = currentImageName
        mainImageView.image = UIImage(named: currentImage)
    }
    

}
