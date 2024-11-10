//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

extension ObservableType {
    static func createAsync<T>(_ asyncFunction: @escaping () async throws -> T) -> Observable<T> {
        return Observable<T>.create { observer in
            let task = Task {
                do {
                    let result = try await asyncFunction()
                    observer.onNext(result)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create { task.cancel() }
        }
    }
    
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
