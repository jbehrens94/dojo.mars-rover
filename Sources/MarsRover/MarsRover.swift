final class MarsRover {
    /// Internal state of the MarsRover.
    /// Non-accessible in the code, but readable in tests.
    private(set) var state: MarsRover.State

    init(state: MarsRover.State) {
        self.state = state
    }

    /// MarsRover can execute commands. They are defined in `Command`.
    /// Example: `execute(.left, .right, .left)`.
    ///
    /// - Parameter commands: one or more `Command` items. Executed in order, one by one.
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
