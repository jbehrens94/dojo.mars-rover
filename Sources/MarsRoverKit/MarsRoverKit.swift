final class Rover: CustomStringConvertible {
    private(set) var state = Rover.State()

    init(position: String) {
        let components = position.split(separator: " ")

        guard
            let xPosition = Int(components[0]),
            let yPosition = Int(components[1]),
            let directionString = components[2].first,
            let direction = Direction(rawValue: directionString)
        else { return }

        state.xPosition = xPosition
        state.yPosition = yPosition
        state.direction = direction
    }

    func execute(commands: [Rover.Command]) {
        let actions: [Rover.Command: () -> Void] = [
            .left: turnLeft,
            .right: turnRight,
            .move: move
        ]

        commands.forEach { command in
            actions[command]?()
        }
    }

    private func turnLeft() {
        let directions: [Direction] = [.north, .west, .south, .east]
        if let index = directions.firstIndex(of: state.direction) {
            state.direction = directions[(index + 1) % directions.count]
        }
    }

    private func turnRight() {
        let directions: [Direction] = [.north, .east, .south, .west]
        if let index = directions.firstIndex(of: state.direction) {
            state.direction = directions[(index + 1) % directions.count]
        }
    }

    private func move() {
        switch state.direction {
        case Direction.east: state.xPosition += 1
        case Direction.south: state.yPosition -= 1
        case Direction.west: state.xPosition -= 1
        case Direction.north: state.yPosition += 1
        }
    }

    var description: String { "\(state.xPosition) \(state.yPosition) \(state.direction.rawValue)" }
}

extension Rover {
    enum Command: Character {
        case left = "L",
             right = "R",
             move = "M",
             none = " "
    }

    enum Direction: Character, Equatable {
        case north = "N",
             east = "E",
             south = "S",
             west = "W"
    }

    final class State: Equatable {
        var xPosition: Int = 0
        var yPosition: Int = 0
        var direction: Rover.Direction = .north

        static func == (lhs: Rover.State, rhs: Rover.State) -> Bool {
            lhs.xPosition == rhs.xPosition &&
            lhs.yPosition == rhs.yPosition &&
            lhs.direction == rhs.direction
        }
    }
}
