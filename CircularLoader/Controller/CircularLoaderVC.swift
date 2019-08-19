//
//  CircularLoaderVC.swift
//  CircularLoader
//
//  Created by Mattia Righetti on 19/08/2019.
//  Copyright © 2019 Mattia Righetti. All rights reserved.
//

import UIKit

class CircularLoaderVC: UIViewController {
    
    let urlString = "http://212.183.159.230/20MB.zip"
    
    private let circleProgressBarLayer: UICircularLayer = UICircularLayer(withProgressBarColor: UIColor.FlatColor.Blue.BlueWhale, UIColor.FlatColor.Blue.Chambray)

    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textColor = .white
        label.font = UIFont(name: "Avenir Next", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.FlatColor.Blue.BlueWhale
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        circleProgressBarLayer.position = CGPoint(x: view.layer.bounds.midX, y: view.layer.bounds.midY)
    }
    
    func setupView() {
        view.layer.addSublayer(circleProgressBarLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        animate(circleProgressBarLayer)
        
        view.addSubview(percentageLabel)
        percentageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        percentageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func animate(_ layer: UICircularLayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.7
        animation.toValue = 1.2
        animation.autoreverses = true
        animation.repeatCount = HUGE
        layer.pulsingRing.add(animation, forKey: nil)
    }
    
    @objc private func handleTap() {
        beginDownloadingFile()
    }

}

extension CircularLoaderVC: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished downloading")
    }

    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)

        DispatchQueue.main.async {
            self.percentageLabel.text = "\(Int(percentage * 100))%"
            self.circleProgressBarLayer.progressRing.strokeEnd = percentage
        }
    }
    
    private func beginDownloadingFile() {
        circleProgressBarLayer.progressRing.strokeEnd = 0
        guard let url = URL(string: urlString) else { return }
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
}
