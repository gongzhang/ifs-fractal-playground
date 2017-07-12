import Foundation

extension Vec {
    
    public func iterate(count: Int, minLength: Double, accumulated: Bool, spawn: (Vec) -> [Vec]) -> [Vec] {
        var acc: [Vec] = []
        var itr: [Vec] = [self]
        
        let minSquare = minLength * minLength
        
        let s = DispatchSemaphore(value: 1)
        for _ in 1...count {
            var next: [Vec] = []
            
            DispatchQueue.concurrentPerform(iterations: itr.count) { index in
                let new = spawn(itr[index])
                
                s.wait()
                if accumulated {
                    acc.append(itr[index])
                }
                for v in new {
                    if v.lengthSquare < minSquare {
                        acc.append(v)
                    } else {
                        next.append(v)
                    }
                }
                s.signal()
            }
            
            itr = next
        }
        return acc + itr
    }
    
}
