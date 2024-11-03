//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

extension ObservableType {
    func observeOnMainThread() -> Observable<Element> {
        return observe(on: MainScheduler.instance)
    }
    
    func ignoreValues() -> Observable<Void> {
        return self.map { _ in () }
    }
    
    func skipNil<Result>() -> Observable<Result> where Element == Result? {
        self.compactMap { $0 }
    }
}
