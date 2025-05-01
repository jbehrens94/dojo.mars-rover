// swiftlint:disable cyclomatic_complexity identifier_name
class RoverState {
    var xx: Int = 0
    var yy: Int = 0
    var dd: Rover.Direction = .north
}

class Rover: CustomStringConvertible {
    enum Command: Character {
        case left = "L",
             right = "R",
             move = "M"
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
            rs.xx = Int(components[0]) ?? 0
            rs.yy = Int(components[1]) ?? 0
            rs.dd = Direction(rawValue: components[2].first ?? "N") ?? .north
        }
    }

    func go(_ cms: String) {
        for c in cms {
            switch c {
            case Command.left.rawValue:
                switch rs.dd {
                case Direction.east: rs.dd = Direction.north
                case Direction.north: rs.dd = Direction.west
                case Direction.west: rs.dd = Direction.south
                case Direction.south: rs.dd = Direction.east
                }
            case Command.right.rawValue:
                switch rs.dd {
                case Direction.east: rs.dd = Direction.south
                case Direction.south: rs.dd = Direction.west
                case Direction.west: rs.dd = Direction.north
                case Direction.north: rs.dd = Direction.east
                }
            case Command.move.rawValue:
                switch rs.dd {
                case Direction.east: rs.xx += 1
                case Direction.south: rs.yy -= 1
                case Direction.west: rs.xx -= 1
                case Direction.north: rs.yy += 1
                }
            default:
                break
            }
        }
    }

    var description: String { "\(rs.xx) \(rs.yy) \(rs.dd.rawValue)" }
}
// swiftlint:enable cyclomatic_complexity identifier_name
