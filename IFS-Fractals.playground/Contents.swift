import UIKit

var r = Vec(start: (-5, -8), end: (0, -4)).iterate(count: 10, minLength: 0.1, accumulated: true) {
    [
        $0.forward(ratio: 1).rotate(.pi / 16).scale(0.7),
        $0.forward(ratio: 0.7).rotate(.pi / 4).scale(0.5),
        $0.forward(ratio: 0.8).rotate(-.pi / 4.5).scale(0.4)
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.9143830128205128, green: 0.9070474738465375, blue: 0.8002353852985501, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2196755617030675, blue: 0.1571135522156086, alpha: 1), vectors: r)


r = Vec(start: (-9, -2), end: (9, -2)).iterate(count: 10, minLength: 0.1, accumulated: false) {
    let v = $0.scale(1.0 / 3.0)
    return [
        v,
        v.forward(ratio: 1.0).rotate60d(),
        v.forward(ratio: 2.0).rotate120d().swap(),
        v.forward(ratio: 2.0)
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.5653888283369868, green: 0.7401781643744909, blue: 0.8174278846153846, alpha: 1), fgcolor: #colorLiteral(red: 0.1946326694948552, green: 0.2711999033340959, blue: 1, alpha: 1), vectors: r)


r = Vec(start: (-2, -4), end: (4, 4)).iterate(count: 20, minLength: 0.2, accumulated: false) {
    [
        $0.scale(sqrt(2) / 2).rotate45d(),
        $0.swap().scale(sqrt(2) / 2).rotate180d().rotate90d().rotate45d()
    ]
}

VecView(bgcolor: #colorLiteral(red: 0.4063196060629969, green: 0.1476675849742995, blue: 0.5, alpha: 1), fgcolor: #colorLiteral(red: 1, green: 0.2488395148723686, blue: 0.9886368439724698, alpha: 1), vectors: r)

