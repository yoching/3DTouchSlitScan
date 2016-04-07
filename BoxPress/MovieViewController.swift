//
//  MovieViewController.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/14/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieViewViewModel: MovieViewViewModelType!

    var movieFrameLayers = [MovieFrameLayer]()
    
    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for layerViewModel in movieViewViewModel.layerViewModels {
            let movieFrameLayer = MovieFrameLayer(viewModel: layerViewModel, frame: UIScreen.mainScreen().bounds)
            movieView.layer.addSublayer(movieFrameLayer.imageLayer)
            movieFrameLayers.append(movieFrameLayer)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        movieViewViewModel.onTouchEnded()
    }

}
