final class Rover: CustomStringConvertible {
    private var state = Rover.State()

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
        commands.forEach { command in
            if case .left = command { turnLeft() }
            if case .right = command { turnRight() }
            if case .move = command { move() }
        }
    }

    private func turnLeft() {
        switch state.direction {
        case Direction.east: state.direction = Direction.north
        case Direction.north: state.direction = Direction.west
        case Direction.west: state.direction = Direction.south
        case Direction.south: state.direction = Direction.east
        }
    }

    private func turnRight() {
        switch state.direction {
        case Direction.east: state.direction = Direction.south
        case Direction.south: state.direction = Direction.west
        case Direction.west: state.direction = Direction.north
        case Direction.north: state.direction = Direction.east
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

    enum Direction: Character {
        case north = "N",
             east = "E",
             south = "S",
             west = "W"
    }

    final class State {
        var xPosition: Int = 0
        var yPosition: Int = 0
        var direction: Rover.Direction = .north
    }
}
