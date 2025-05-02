final class MarsRover {
    private(set) var state: MarsRover.State

    init(state: MarsRover.State) {
        self.state = state
    }

    func execute(commands: [MarsRover.Command]) {
        let actions: [MarsRover.Command: () -> Void] = [
            .left: { self.state.turn(clockwise: false) },
            .right: { self.state.turn() },
            .move: { self.state.move() }
        ]

        commands.forEach { command in
            actions[command]?()
        }
    }
}
