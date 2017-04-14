
import Dispatch
import Fetcher
import Sleeper
import Reducer
import FetchResult

print("gcd etude")

class Mainer {
  let fetchers = [
    Fetcher(name: "Foo", delay: 1),
    Fetcher(name: "Bar", delay: 1),
    Fetcher(name: "Cow", delay: 1),
    Fetcher(name: "Moose", delay: 1),
  ]


  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let fetchResultHouse = FetchResultHouse()
  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))




  func go() {
    let fetcherSchedulers = fetchers.map() { 
      FetcherScheduler(fetcher: $0, interval: 1000000 * 4, fetcherQueue: self.fetcherQueue, fetchResultHouse: self.fetchResultHouse)
    }
    for f in fetcherSchedulers {
      f.go()
    }
  }
}

let mainer = Mainer()
mainer.go()

