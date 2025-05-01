import XCTest

@testable
import MarsRoverKit

final class MarsRoverTests: XCTestCase {
    struct TestCase {
        let actual: String
        let commands: [Rover.Command]
        let expected: String
    }

    private let testCases: [TestCase] = [
        TestCase(actual: "1 2 N", commands: [.none], expected: "1 2 N"),
        TestCase(actual: "1 2 N", commands: [.left], expected: "1 2 W"),
        TestCase(actual: "1 2 W", commands: [.left], expected: "1 2 S"),
        TestCase(actual: "1 2 S", commands: [.left], expected: "1 2 E"),
        TestCase(actual: "1 2 E", commands: [.left], expected: "1 2 N"),
        TestCase(actual: "1 2 N", commands: [.right], expected: "1 2 E"),
        TestCase(actual: "1 2 E", commands: [.right], expected: "1 2 S"),
        TestCase(actual: "1 2 S", commands: [.right], expected: "1 2 W"),
        TestCase(actual: "1 2 W", commands: [.right], expected: "1 2 N"),
        TestCase(actual: "1 2 N", commands: [.move], expected: "1 3 N"),
        TestCase(actual: "1 2 E", commands: [.move], expected: "2 2 E"),
        TestCase(actual: "1 2 S", commands: [.move], expected: "1 1 S"),
        TestCase(actual: "1 2 W", commands: [.move], expected: "0 2 W"),
        TestCase(
            actual: "1 2 N",
            commands: [.left, .move, .left, .move, .left, .move, .left, .move, .move],
            expected: "1 3 N"
        ),
        TestCase(
            actual: "3 3 E",
            commands: [.move, .move, .right, .move, .move, .right, .move, .right, .right, .move],
            expected: "5 1 E"
        )
    ]

    func test_rover_whenMovementsAreGiven_thenPositionIsUpdated() {
        for testCase in testCases {
            let rover = Rover(position: testCase.actual)
            rover.execute(commands: testCase.commands)

            XCTAssertEqual(
                rover.description,
                testCase.expected,
                "Failed for starting position: \(testCase.actual), instructions: \(testCase.commands)"
            )
        }
    }

    func test_whenRoverIsInitializedWithIncorrectValues_stateIsDefault() {
        let rover = Rover(position: "-1 -1 R")

        XCTAssertEqual(rover.state, Rover.State())
    }
}
