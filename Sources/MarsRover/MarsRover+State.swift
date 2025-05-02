extension MarsRover {
    struct State: Equatable {
        private var xPosition: Int = 0
        private var yPosition: Int = 0
        private var direction: MarsRover.Direction = .north

        init(xPosition: Int, yPosition: Int, direction: MarsRover.Direction) {
            self.xPosition = xPosition
            self.yPosition = yPosition
            self.direction = direction
        }

        /// Turn the Rover into a certain direction.
        ///
        /// - Parameter clockwise: if `true`, turning right. If `false` turning left.
        mutating func turn(clockwise: Bool = true) {
            let directions = Direction.allCases
            let distance = clockwise ? 1 : 3

            if let index = directions.firstIndex(of: direction) {
                direction = directions[(index + distance) % directions.count]
            }
        }

        /// Move the Rover in the `direction`. The movement is determined by the `delta` defined in `Direction`.
        mutating func move() {
            xPosition += direction.delta.x
            yPosition += direction.delta.y
        }

        /// To be able to compare `State` in testing, it needs to be `Equatable`.
        static func == (lhs: MarsRover.State, rhs: MarsRover.State) -> Bool {
            lhs.xPosition == rhs.xPosition &&
            lhs.yPosition == rhs.yPosition &&
            lhs.direction == rhs.direction
        }
    }
}
