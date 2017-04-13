
import Dispatch
import Fetcher



print("gcd etude")


let fetchers = [
  Fetcher(name: "Foo"),
  Fetcher(name: "Bar"),
  Fetcher(name: "Cow"),
  Fetcher(name: "Moose"),
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

let oneSecond: UInt32 = 1000000
while true {
  usleep(2 * oneSecond)
  
  oneTurn()

}

