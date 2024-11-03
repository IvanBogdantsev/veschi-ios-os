//  veschi-ios-os
//  Created by Ivan B.

import UIKit

protocol DisplaysLoaderInterface {
    func displayLoader()
    func hideLoader(completion: (() -> Void)?)
}

extension DisplaysLoaderInterface where Self: UIViewController {
    func displayLoader() {
        let loadingView = view?.findSubview(ofType: LoadingView.self) ?? LoadingView()
        if !view.subviews.contains(loadingView) {
            view.addSubview(loadingView)
            loadingView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        loadingView.show(animated: true)
    }
    
    func hideLoader(completion: (() -> Void)? = nil) {
        if let loadingView = view?.findSubview(ofType: LoadingView.self) {
            loadingView.hide(animated: true) { _ in
                completion?()
            }
        } else {
            completion?()
        }
    }
}
