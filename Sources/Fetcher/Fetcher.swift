class Fetcher {
  let name: String
  
  init(name: String) {
    self.name = name
  }


  func fetch() -> [String: String] {
    // pretend we hit an external data source
   return [self.name: "data for \(self.name)"]
  }
}
