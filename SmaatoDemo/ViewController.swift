//
//  ViewController.swift
//  SmaatoDemo
//
//  Created by Angelos Staboulis on 30/7/20.
//  Copyright © 2020 Angelos Staboulis. All rights reserved.
//

import UIKit
import SmaatoSDKBanner
class ViewController: UIViewController,SMABannerViewDelegate {
    func presentingViewController(for bannerView: SMABannerView) -> UIViewController {
        debugPrint("banner present")
        return self
    }
    
    func bannerViewDidTTLExpire(_ bannerView: SMABannerView) {
        debugPrint("banner expirt")
    }
    
    
    @IBOutlet var bannerView: SMABannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let KVP = SMAKeyValuePairs()
        // replace with your key-value pairs configured within your SPX account
        
        KVP.setTargetingValue("30", forKey: "Age")
        // replace with your key-value pairs configured within your SPX account
        
        KVP.setTargetingValues(["Demo", "Stage"], forKey: "Application")
        
        SMABannerView.keyValuePairs = KVP
        
        self.bannerView.autoreloadInterval = .short
          // (required) set the delegate
              self.bannerView.delegate = self
          // load the banner, with desired size
        self.bannerView.load(withAdSpaceId: "130626424", adSize: .xxLarge_320x50)
        // Do any additional setup after loading the view.
    }
 
}

