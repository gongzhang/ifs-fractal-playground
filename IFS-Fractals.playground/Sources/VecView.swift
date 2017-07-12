import UIKit

open class VecView: UIView {
    
    var origin: Point
    var scale: Double
    
    var foregroundColor: UIColor
    
    var vectors: [Vec]
    
    public init(
        frame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 400),
        bgcolor: UIColor,
        fgcolor: UIColor,
        origin: Point = Point(x: 200, y: 200),
        scale: Double = 20.0,
        vectors: [Vec]) {
            foregroundColor = fgcolor
            self.origin = origin
            self.scale = scale
            self.vectors = vectors
            
            super.init(frame: frame)
            backgroundColor = bgcolor
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(foregroundColor.cgColor)
        context.setLineWidth(CGFloat(1.0 / scale))
        
        context.saveGState()
        context.translateBy(x: CGFloat(origin.x), y: CGFloat(origin.y))
        context.scaleBy(x: CGFloat(scale), y: CGFloat(-scale))
        
        for vec in vectors {
            context.move(to: CGPoint(x: CGFloat(vec.start.x), y: CGFloat(vec.start.y)))
            context.addLine(to: CGPoint(x: CGFloat(vec.end.x), y: CGFloat(vec.end.y)))
            context.strokePath()
        }
        
        context.strokePath()
        context.restoreGState()
    }
    
}

