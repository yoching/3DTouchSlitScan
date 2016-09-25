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
    @IBAction func backDidTap(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for layerViewModel in movieViewViewModel.layerViewModels {
            let movieFrameLayer = MovieFrameLayer(viewModel: layerViewModel, frame: UIScreen.main.bounds)
            movieView.layer.addSublayer(movieFrameLayer.imageLayer)
            movieFrameLayers.append(movieFrameLayer)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        movieViewViewModel.onTouchEnded()
    }

}
