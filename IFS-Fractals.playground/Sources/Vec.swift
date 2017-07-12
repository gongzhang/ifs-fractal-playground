import Foundation

public struct Vec : CustomStringConvertible {
    
    public var start: Point
    public var end: Point
    
    public var delta: Point {
        return end - start
    }
    
    public var lengthSquare: Double {
        return delta.lengthSquare
    }
    
    public init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
    
    public init(start: (Double, Double), end: (Double, Double)) {
        self.start = Point(x: start.0, y: start.1)
        self.end = Point(x: end.0, y: end.1)
    }
    
    public var description: String {
        return "\(start)->\(end)"
    }
    
    public func translate(_ delta: Point) -> Vec {
        return Vec(start: start + delta, end: end + delta)
    }
    
    public func rotate(_ angle: Double) -> Vec {
        var p = delta
        let rcos = cos(angle)
        let rsin = sin(angle)
        p = Point(x: p.x * rcos - p.y * rsin, y: p.y * rcos + p.x * rsin)
        return Vec(start: start, end: p + start)
    }
    
    public func scale(_ mul: Double) -> Vec {
        var p = delta
        p.x *= mul
        p.y *= mul
        return Vec(start: start, end: p + start)
    }
    
    public func swap() -> Vec {
        return Vec(start: end, end: start)
    }
    
    public func forward(ratio: Double) -> Vec {
        return translate(delta * ratio)
    }
    
}

let sin15 = sin(Double.pi / 12)
let sin30 = sin(Double.pi / 6)
let sin45 = sin(Double.pi / 4)
let sin60 = sin(Double.pi / 3)
let sin90 = sin(Double.pi / 2)
let sin120 = sin(Double.pi * 2.0 / 3.0)
let sin150 = sin(Double.pi * 5.0 / 6.0)
let sin180 = sin(Double.pi)

let cos15 = cos(Double.pi / 12)
let cos30 = cos(Double.pi / 6)
let cos45 = cos(Double.pi / 4)
let cos60 = cos(Double.pi / 3)
let cos90 = cos(Double.pi / 2)
let cos120 = cos(Double.pi * 2.0 / 3.0)
let cos150 = cos(Double.pi * 5.0 / 6.0)
let cos180 = cos(Double.pi)

public extension Vec {
    
    public func rotate15d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos15 - p.y * sin15, y: p.y * cos15 + p.x * sin15)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate30d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos30 - p.y * sin30, y: p.y * cos30 + p.x * sin30)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate45d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos45 - p.y * sin45, y: p.y * cos45 + p.x * sin45)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate60d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos60 - p.y * sin60, y: p.y * cos60 + p.x * sin60)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate90d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos90 - p.y * sin90, y: p.y * cos90 + p.x * sin90)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate120d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos120 - p.y * sin120, y: p.y * cos120 + p.x * sin120)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate150d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos150 - p.y * sin150, y: p.y * cos150 + p.x * sin150)
        return Vec(start: start, end: p + start)
    }
    
    public func rotate180d() -> Vec {
        var p = delta
        p = Point(x: p.x * cos180 - p.y * sin180, y: p.y * cos180 + p.x * sin180)
        return Vec(start: start, end: p + start)
    }
    
}
