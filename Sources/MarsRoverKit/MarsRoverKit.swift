// swiftlint:disable identifier_name
class RoverState {
    var xPosition: Int = 0
    var yPosition: Int = 0
    var direction: Rover.Direction = .north
}

class Rover: CustomStringConvertible {
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

    private var rs = RoverState()

    init(position: String) {
        let components = position.split(separator: " ")
        if components.count >= 3 {
            rs.xPosition = Int(components[0]) ?? 0
            rs.yPosition = Int(components[1]) ?? 0
            rs.direction = Direction(rawValue: components[2].first ?? "N") ?? .north
        }
    }

    func execute(commands: [Rover.Command]) {
        commands.forEach { command in
            if case .left = command {
                turnLeft()
            }

            if case .right = command {
                turnRight()
            }

            if case .move = command {
                move()
            }
        }
    }

    private func turnLeft() {
        switch rs.direction {
        case Direction.east: rs.direction = Direction.north
        case Direction.north: rs.direction = Direction.west
        case Direction.west: rs.direction = Direction.south
        case Direction.south: rs.direction = Direction.east
        }
    }

    private func turnRight() {
        switch rs.direction {
        case Direction.east: rs.direction = Direction.south
        case Direction.south: rs.direction = Direction.west
        case Direction.west: rs.direction = Direction.north
        case Direction.north: rs.direction = Direction.east
        }
    }

    private func move() {
        switch rs.direction {
        case Direction.east: rs.xPosition += 1
        case Direction.south: rs.yPosition -= 1
        case Direction.west: rs.xPosition -= 1
        case Direction.north: rs.yPosition += 1
        }
    }

    var description: String { "\(rs.xPosition) \(rs.yPosition) \(rs.direction.rawValue)" }
}
// swiftlint:enable identifier_name
