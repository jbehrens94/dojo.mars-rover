* [ ] Refactoring goals
    * [x] Replace magic numbers/strings
    * [x] Rename `RoverState.xx`
    * [x] Rename `RoverState.yy`
    * [x] Rename `RoverState.dd`
    * [x] Rename `Rover.init(_:)` `p` parameter
    * [x] Rename `Rover.init(_:)` `s` parameter
    * [x] Rename `go(_:)` `cms` parameter
    * [x] Replace inner `switch` in `go(_:)`
    * [x] Replace outer `switch` in `go(_:)`
    * [x] Replace `pos()` with `CustomStringConvertible`.
    * [x] Get rid of `g(_:)` method, as it seems to be dead.
    * [x] Get rid of tuple in test cases for an actual model.
    * [x] Rename RoverState variable `rs`.
    * [x] Make initialization less depending on force unwraps.
    * [ ] Extract state into something less mutable.
