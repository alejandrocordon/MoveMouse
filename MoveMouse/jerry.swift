import Cocoa
import Foundation

func moveAroundAndLeftClick(moves: Int) {
    let screenSize = NSScreen.main?.visibleFrame.size
    let currentLocation = NSEvent.mouseLocation
    var currentPoint = CGPoint(x: currentLocation.x, y: currentLocation.y)

    for _ in 0 ... moves {
        let randomXPos = CGFloat.random(in: 0..<screenSize!.width)
        let randomYPos = CGFloat.random(in: 0..<screenSize!.height)
        let destination = CGPoint(x: randomXPos, y: randomYPos)
        let easing = Float.random(in: 270..<680)

        humanizedMouseMove(from: currentPoint, to: destination, easing: easing)

        let pause = Int.random(in: 5_000_000..<6_000_000)
        print("pause: ", pause)
        usleep(useconds_t(pause))
        //mouseClick(point: destination, mouseButton: CGMouseButton.left)
        currentPoint = destination
    }
    print("Done. Moves performed: ", moves)
}


func moveAroundAndLeftClick() {
    let screenSize = NSScreen.main?.visibleFrame.size
    let currentLocation = NSEvent.mouseLocation
    var currentPoint = CGPoint(x: currentLocation.x, y: currentLocation.y)

    
    repeat {
        let randomXPos = CGFloat.random(in: 0..<screenSize!.width)
        let randomYPos = CGFloat.random(in: 0..<screenSize!.height)
        let destination = CGPoint(x: randomXPos, y: randomYPos)
        let easing = Float.random(in: 270..<680)

        humanizedMouseMove(from: currentPoint, to: destination, easing: easing)

        
        let pause = Int.random(in: jerry.timeInt*1_000_000..<(jerry.timeInt+1)*1_000_000)
        print("pause: ", pause, jerry.go)
        usleep(useconds_t(pause))
        //mouseClick(point: destination, mouseButton: CGMouseButton.left)
        currentPoint = destination
        
    } while(jerry.go == true)
   

    print("Done. Moves performed: ", jerry.go)
}


func moveMouseTo(point: CGPoint) {
    CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: point, mouseButton: CGMouseButton.left)?.post(tap: CGEventTapLocation.cghidEventTap)
}

func mouseClick(point: CGPoint, mouseButton: CGMouseButton = CGMouseButton.left) {
    CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseDown, mouseCursorPosition: point, mouseButton: mouseButton)?.post(tap: CGEventTapLocation.cghidEventTap)
    usleep(useconds_t(Int.random(in: 400_010..<600_200)))
    CGEvent(mouseEventSource: nil, mouseType: CGEventType.leftMouseUp, mouseCursorPosition: point, mouseButton: mouseButton)?.post(tap: CGEventTapLocation.cghidEventTap)
}

func humanizedMouseMove(from: CGPoint, to: CGPoint, easing: Float = 100.0) {
    print("current location: ", from)
    print("moving to: ", to)
    let distance = distanceBetween(from: from, to: to)
    let steps = Int(distance * CGFloat(easing) / 100) + 1;
    let xDiff = to.x - from.x
    let yDiff = to.y - from.y
    let stepSize = 1.0 / Double(steps)
    
    for i in 0 ... steps {
        let factor = cubicEaseOut(point: Float(stepSize) * Float(i))
        let stepPoint = CGPoint(x: from.x + (CGFloat(factor) * xDiff), y: from.y + (CGFloat(factor) * yDiff))
        moveMouseTo(point: stepPoint)
        usleep(useconds_t(stepPause()))
    }
}

func stepPause() -> Int {
    return Int.random(in: 200..<300)
}

func distanceBetween(from: CGPoint, to: CGPoint) -> CGFloat {
    let distanceX = from.x - to.x
    let distanceY = from.y - to.y
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}

// stolen from cliclick
func cubicEaseOut(point: Float) -> Float {
    if(point < 0.5) {
        return 4 * point * point * point
    } else {
        let f = ((2 * point) - 2)
        return 0.5 * f * f * f + 1
    }
}
