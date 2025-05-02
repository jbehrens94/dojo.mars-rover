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

        mutating func move() {
            switch direction {
            case Direction.east: xPosition += 1
            case Direction.south: yPosition -= 1
            case Direction.west: xPosition -= 1
            case Direction.north: yPosition += 1
            }
        }

        static func == (lhs: MarsRover.State, rhs: MarsRover.State) -> Bool {
            lhs.xPosition == rhs.xPosition &&
            lhs.yPosition == rhs.yPosition &&
            lhs.direction == rhs.direction
        }
    }
}
