import Foundation

class ReusableIndexSource {
  init() {
  }

  var inUseIndexes = [UUID]()

  func getIndex() -> UUID {
    var candidate = UUID()
    while inUseIndexes.contains(candidate) {
      candidate = UUID()
    }
    inUseIndexes.append(candidate)
    return candidate
  }
  
  func retire(_ index: UUID) {
    if let k = inUseIndexes.index(of: index) {
      inUseIndexes.remove(at: k)
    } else {
      print("problem! tried to remove \(index) from \(inUseIndexes)")
    }

  }

}


