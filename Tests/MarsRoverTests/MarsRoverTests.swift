import XCTest

@testable
import MarsRover

final class MarsRoverTests: XCTestCase {
    struct TestCase {
        let actual: MarsRover.State
        let commands: [MarsRover.Command]
        let expected: MarsRover.State
    }

    private let testCases: [TestCase] = [
        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north),
            commands: [],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north),
            commands: [.left],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .west)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .west),
            commands: [.left],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .south)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .south),
            commands: [.left],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .east)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .east),
            commands: [.left],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north),
            commands: [.right],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .east)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .east),
            commands: [.right],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .south)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .south),
            commands: [.right],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .west)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .west),
            commands: [.right],
            expected: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north),
            commands: [.move],
            expected: MarsRover.State(xPosition: 1, yPosition: 3, direction: .north)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .east),
            commands: [.move],
            expected: MarsRover.State(xPosition: 2, yPosition: 2, direction: .east)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .south),
            commands: [.move],
            expected: MarsRover.State(xPosition: 1, yPosition: 1, direction: .south)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .west),
            commands: [.move],
            expected: MarsRover.State(xPosition: 0, yPosition: 2, direction: .west)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 1, yPosition: 2, direction: .north),
            commands: [.left, .move, .left, .move, .left, .move, .left, .move, .move],
            expected: MarsRover.State(xPosition: 1, yPosition: 3, direction: .north)
        ),

        TestCase(
            actual: MarsRover.State(xPosition: 3, yPosition: 3, direction: .east),
            commands: [.move, .move, .right, .move, .move, .right, .move, .right, .right, .move],
            expected: MarsRover.State(xPosition: 5, yPosition: 1, direction: .east)
        )
    ]

    func test_rover_whenMovementsAreGiven_thenPositionIsUpdated() {
        for testCase in testCases {
            let rover = MarsRover(state: testCase.actual)
            rover.execute(commands: testCase.commands)

            XCTAssertEqual(rover.state, testCase.expected)
        }
    }
}
