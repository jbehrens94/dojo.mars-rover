extension MarsRover {
    enum Direction: Character, Equatable, CaseIterable {
        case north = "N",
             east = "E",
             south = "S",
             west = "W"

        var delta: (x: Int, y: Int) {
            switch self {
            case .east: return (x: 1, y: 0)
            case .south: return (x: 0, y: -1)
            case .west: return (x: -1, y: 0)
            case .north: return (x: 0, y: 1)
            }
        }
    }
}
