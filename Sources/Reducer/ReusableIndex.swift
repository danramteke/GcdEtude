class ReusableIndexProvider {
  init() {
  }
  
  var unusedIndexes = [Int]()
  var inUseIndexes = [Int]()
  
  var counter: Int = 0
  
  func getIndex() -> Int {
    if let nextUnused = unusedIndexes.popLast() {
      return nextUnused
    } else {
      counter += 1
      inUseIndexes.append(counter)
      return counter
    }
  }
  
  func retireIndex(_ index: Int) {
    if let k = inUseIndexes.index(of: index) {
      inUseIndexes.remove(at: k)
    } else {
      print("problem! tried to remove \(index) from \(inUseIndexes)")
    }
    unusedIndexes.append(index)
  }

}


