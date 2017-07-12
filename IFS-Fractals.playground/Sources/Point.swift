import Foundation

public struct Point : CustomStringConvertible {
    
    public var x = 0.0
    public var y = 0.0
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public var description: String {
        return "(\(x), \(y))"
    }
    
    public var lengthSquare: Double {
        return x * x + y * y
    }
    
}

public prefix func - (p: Point) -> Point {
    return Point(x: -p.x, y: -p.y)
}

public func + (p1: Point, p2: Point) -> Point {
    return Point(x: p1.x + p2.x, y: p1.y + p2.y)
}

public func + (p1: Point, p2: (Double, Double)) -> Point {
    return Point(x: p1.x + p2.0, y: p1.y + p2.1)
}

public func - (p1: Point, p2: Point) -> Point {
    return Point(x: p1.x - p2.x, y: p1.y - p2.y)
}

public func - (p1: Point, p2: (Double, Double)) -> Point {
    return Point(x: p1.x - p2.0, y: p1.y - p2.1)
}

public func * (p: Point, mul: Double) -> Point {
    return Point(x: p.x * mul, y: p.y * mul)
}
