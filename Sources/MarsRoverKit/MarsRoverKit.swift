// swiftlint:disable cyclomatic_complexity identifier_name implicit_return
class RoverState {
    var xx: Int = 0
    var yy: Int = 0
    var dd: Character = "N"
}

class Rover {
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

    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            rs.xx = Int(s[0]) ?? 0
            rs.yy = Int(s[1]) ?? 0
            rs.dd = s[2].first ?? Direction.north.rawValue
        }
    }

    func go(_ cms: String) {
        for c in cms {
            switch c {
            case Command.left.rawValue:
                switch rs.dd {
                case Direction.east.rawValue: rs.dd = Direction.north.rawValue
                case Direction.north.rawValue: rs.dd = Direction.west.rawValue
                case Direction.west.rawValue: rs.dd = Direction.south.rawValue
                case Direction.south.rawValue: rs.dd = Direction.east.rawValue
                default: break
                }
            case Command.right.rawValue:
                switch rs.dd {
                case Direction.east.rawValue: rs.dd = Direction.south.rawValue
                case Direction.south.rawValue: rs.dd = Direction.west.rawValue
                case Direction.west.rawValue: rs.dd = Direction.north.rawValue
                case Direction.north.rawValue: rs.dd = Direction.east.rawValue
                default: break
                }
            case Command.move.rawValue:
                switch rs.dd {
                case Direction.east.rawValue: rs.xx += 1
                case Direction.south.rawValue: rs.yy -= 1
                case Direction.west.rawValue: rs.xx -= 1
                case Direction.north.rawValue: rs.yy += 1
                default: break
                }
            default:
                break
            }
        }
    }

    func pos() -> String {
        return "\(rs.xx) \(rs.yy) \(rs.dd)"
    }
}
// swiftlint:enable cyclomatic_complexity identifier_name implicit_return
