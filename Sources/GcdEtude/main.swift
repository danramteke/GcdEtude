
import Dispatch
import Fetcher
import Sleeper
import Reducer
import FetchResult


print("gcd etude")

class Mainer {
  let semaphore = DispatchGroup()
  let fetchers = [
    Fetcher(name: "Foo", interval: 1000000 * 2),
    Fetcher(name: "Bar", interval: 1000000 * 2),
    Fetcher(name: "Cow", interval: 1000000 * 4),
    Fetcher(name: "Moose", interval: 1000000 * 3),
  ]


  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let schedulerQueue = DispatchQueue(label: "SchedulerQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))

  lazy var fetchResultHouse: FetchResultHouse = FetchResultHouse() { results in
    print("new results delivered to mainer block \(results.count)")
  }



  func go() {

    let fetcherSchedulers: [FetcherScheduler] = fetchers.map { k in
      return FetcherScheduler(fetcher: k, fetcherQueue: self.fetcherQueue, fetchResultHouse: self.fetchResultHouse)
    }

    for f in fetcherSchedulers {
      print(f)
      
      schedulerQueue.async {
        f.go()
      }
      
    }
    

    semaphore.enter()
    semaphore.wait()

  }
}


let mainer = Mainer()
mainer.go()

