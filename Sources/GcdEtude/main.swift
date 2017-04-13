
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

var latestFetches = [String: String]()



func oneTurn() {
  print("latest fetches: \(latestFetches)")
  for fetcher in fetchers {
    fetcherQueue.async(execute: DispatchWorkItem(block: {
      let result = fetcher.fetch()
      
      DispatchQueue.main.async {
        latestFetches["ASdf"] = "asdf"
        print(latestFetches)
      }
       

      
    }))
  }
  
   
}



oneTurn()

let oneSecond: UInt32 = 1000000
while true {
  usleep(2 * oneSecond)
  
  oneTurn()

}