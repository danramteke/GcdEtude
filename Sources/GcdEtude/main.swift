
import Dispatch
import Fetcher
import Sleeper


print("gcd etude")


let fetchers = [
  Fetcher(name: "Foo", delay: 2),
  Fetcher(name: "Bar", delay: 2),
  Fetcher(name: "Cow", delay: 2),
  Fetcher(name: "Moose", delay: 2),
]


let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)

var latestFetches = [String: FetchResult]()

func printLatestFetches() {
  print("latestFetches: [")
  for (key, value) in latestFetches {
    print("  \(key): \(value)")
  }
  print("]")
}


func oneTurn() {
  printLatestFetches()
  for fetcher in fetchers {
    fetcherQueue.async(execute: DispatchWorkItem(block: {
      let result = fetcher.fetch()
      latestFetches[fetcher.name] = result
    }))
  }
  
   
}



oneTurn()


while true {
  Sleeper.sleep(seconds: 10)
  
  oneTurn()

}

//everytime a fetcher returns, recompute the reduction