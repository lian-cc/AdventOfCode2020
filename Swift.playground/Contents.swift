import UIKit

/*
 * Day 3: Toboggan Trajectory
 */

class Solution {
    
    func result(_ input: String) -> Int {
        var answer: Int = 1
        let ways: [(Int, Int)] = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
        for (x, y) in ways {
            let tree = trees(for: input, deltaX: x, deltaY: y)
            print(tree)
            answer *= tree
        }
        return answer
    }
    
    func trees(for input: String, deltaX: Int, deltaY: Int) -> Int {
        var x: Int = 0
        var y: Int = 0
        var count: Int = 0
        
        let rows = input.components(separatedBy: "\n")
        guard let columns = rows.first?.count else {
            fatalError("Input is invalid")
        }
        
        while y < rows.count {
            let row = rows[y]
            let c = row[row.index(row.startIndex, offsetBy: x)]
            if c == "#" {
                count += 1
            }
            x += deltaX
            if x >= columns {
                x -= columns
            }
            y += deltaY
        }
        
        return count
    }
}

let sol = Solution()
sol.result(
    """
    ..#......###....#...##..#.#....
    .#.#.....#.##.....###...##...##
    ..#.#..#...........#.#..#......
    ..#......#..........###........
    ...#..###..##.#..#.......##..##
    ......#.#.##...#...#....###....
    ..........##.....##..##......#.
    ......#...........#............
    #....#..........#..............
    .#........##.............###.##
    ....#.........#.......#.#....##
    #.#..#..#..#.......#...#....##.
    .#........#......#.##.......#..
    ..#.....#####.....#....#..#..##
    .......#..##.......#......#.###
    ..#.#...#......#.##...#........
    ##...................#...##..#.
    ......#...#.##...##.#......#..#
    .#.................#..##...#...
    ...#.....#.......##.....#.#....
    .......#.#......#.....#..#..##.
    ..........#........#...........
    ..#.#..........................
    .#.##..#.#...#...#.........#...
    .....#....#.....#..#.....#.....
    ...#.#.#.....#.#..#.......#..#.
    .....#...###...##...#......##..
    #.###......#.#...#.#.#..###....
    #.....#..##......#..........#.#
    #...............#........#.#..#
    .....#..#.........#......##.#..
    .....#.##.##..#..##............
    ...#......##...............#.#.
    .#..#.#............##.#........
    #.....#..###.............##.#..
    ...##..#.#..#...........#..#...
    #....#.........#.#.............
    ##.#.........#..###......#.#..#
    ...#...#......#.#.#.##..#.##...
    .....##............#.##.##..#..
    ....#................#.##..#..#
    ...#..#.......#...#..#........#
    ....#...#...#................#.
    ....##...............#.#...#...
    .#.....###...#.......#.##......
    ....######.#..............###.#
    .#..#.........##...............
    ................##.#..#....###.
    .......#............#.#..#..#..
    ......#.#...............##.#...
    ...#..####.#...#..#..#......#..
    ....#.#...#.....#.........#..##
    .##..#...#......##....##.#.#...
    .##.#.........##...#....#......
    ..#.#..#...#.#..#.......#...#.#
    .........#..#.....##..#........
    ..#......#..##.....#..#...###..
    ..#...#....#.#..#..#.#.#..#.#..
    ...#..#####.....#......#.......
    #.#............#......#..#...#.
    .........#..........###.......#
    ......#....#..#.##.#......#..#.
    ...........##.#....#.#..#......
    ..#...................#..#.#...
    #....##.............##....#...#
    ##..#....#.........#..........#
    ....#.#.#...#..#........#.##..#
    ...............#...#..##..#....
    .##.......#.......#...........#
    #.........................##...
    #........#.#..#..##..####.#....
    ...................##.....###..
    .#.......#..#......#......#...#
    ..#.........#...#..........#...
    ..........#......#....#........
    .#......#..#...#..#...##....##.
    ...#.#..#..#......#.....##.####
    .......#.#....#.......#........
    #...#.#...##..##.#......#......
    .#.........#...................
    ...#..........#.#......#.......
    ...#.....##....#..........#....
    .#..........##..#..#..##....#.#
    .##.#..........#...#.##.......#
    #...###....#..#.#...#..#.......
    ..................##...........
    ..#...##.#...........#....#.##.
    ..#......#..##..#....##..#...#.
    ..#....#.....#.##..#.......#..#
    #...#....#..#.#....#......##...
    .......##..#..........#........
    ..#.............##.#.....#...#.
    ...............#....#...#...##.
    ##...........#.......#.##......
    #..#...........#.........#.....
    ....###.............###.##..##.
    .........#.#.....###.......#...
    ..#.##....#.#..........#....#..
    #........#....##...#..#........
    ......#..........###..#.#......
    .....#.#......##.....#..##...#.
    .#.......#......#...#...#...#.#
    .#..........##.......#.....##.#
    ###.#...#....#.....#...#......#
    ..#.#.#..#.##.#..#.............
    .....#.........................
    .#..###..#...#...#..#..#...#.#.
    #................##...##.##....
    ......#...#...#..........#...#.
    ..........#.....##.............
    ..#.#......#........#.......#..
    ........##.............#.......
    .......#......#.##.#..#........
    #.#.#....#........#..........#.
    ##..##......#..#..#.....#.#..##
    ##..#..........#...............
    #.....##...#.#......#.......#.#
    #.....#...#....#..#.....##.....
    ##..........#.#.....#....#...##
    ..##.###..#.....#.......#...#..
    .#.#.......#......###........#.
    .#..............#.#..###.......
    .#....#..##.........#..#.#.....
    ....#....#.#....#..#.......##.#
    #.......#.......#.........#....
    ...#....#....#.....##..#..#.#.#
    ........#....#...........#.....
    .#......##.#.#.##..............
    #..#.#.....##........#........#
    ##...#.#.......##.......#...#..
    #...#.....#.##...##.#.....#....
    ....#..##...#........#.#...#...
    ...#....#.#.#..###...##.#.....#
    ......#..#.....#..#........##..
    .......#.....#.#.........#.#..#
    ..#.......#.#.#.#.#....#.##...#
    .#...#........#..##..#......#..
    .#..#............#...#..#.#....
    ...##......#......#............
    ..#...#.#.....#.....#..##.#....
    .#......#.#......#..#.#........
    ..#..........##...#.#.....#..#.
    #...#.....#..#...#.............
    ..##.................#....#....
    .#....#.......#..##....#......#
    .#....###............##....##.#
    ##..#........#..#...#.......#..
    .....#.....#.#.#.##.........#..
    .......#..#....#...#...#.......
    ...#...#...#.#.#..#.#.....#....
    #.#........#..#.##..#..###.....
    ..................#..#.........
    #.#.....#..##.........#.......#
    ###..#.......#..............#..
    ......#..#.....###..........#..
    ....#.#...#..#...........#.#...
    ...#.....#.......#.....#.#.....
    #.....##..#......##...........#
    #...###...........##..#...#.##.
    ......##.##.#...#..#....#......
    ...#.#......##.#......##....#.#
    ..............#.#.###.......#..
    ........#....#.......##..#..###
    ...#.....##.#....#......##..#.#
    ..##........#.....#.#..#...#...
    .#..#.##.........#.....#...#..#
    ..#..#....#...........#........
    .#...#....................#....
    ##.....##....#.............#.#.
    ....#.#..#.#..#.#.#..........##
    .............##.#.....#..#..#..
    .#....#.....##...#.###.........
    ..#........#........#.#..###...
    .##....#...#...#.......#...#.#.
    ..#...#...#..##........#..#....
    ..##.#..#..#.....#......#.#..#.
    .#........#..#....#..#.........
    ..#.#.....#.##..#........###.#.
    .....#.##.....##.#.............
    #.........#.......#...##...#...
    ..#.##.#..#..#............#....
    .##....#..#............#.....#.
    ###........##.....##.#...#.....
    #......##..##.#.#.#.#.#.#..##..
    .....###.....#....#......#....#
    ........#.........##...#....#.#
    .#.#.....#.#..#..##......#...#.
    ...#.##....#..#.###..#..##.....
    ....#..........##..#..#..#..#..
    ...#..#.##..#..#....#.........#
    .....#..###.#.....#.....#..#...
    ......#...#....#.##...#.#......
    .#.###..##.....##.##......##...
    .....#.#...........#.#.........
    #........#...#..#......##.#....
    ..#.......##....##....#.##.#..#
    ...###.#.........#......#.....#
    ..#.##..#....#.....##...#.##...
    ....##.##.............#...#....
    ##..#...#..#..#..#.............
    .....#.....#.....#.............
    ...#.##.......#..#.#.....#....#
    #.....##.........#......##.....
    .....##..........#..#...#..#...
    #...###....#.......#...##......
    .#....#..#......#.....#...#.#..
    #........#.#.#...#.....###.#.##
    ##...#...##..#..#....#.........
    ....#............#..#.....#....
    #......#.........##....#.......
    .#..#..#........#.............#
    .##..........#......#.......#..
    #............#..#....#.........
    ....#.#.....#.##...#.....#.#...
    ...#.#..#...##..#...#.#.#......
    #....#..#.........##..#.#.#..##
    .#...#..............#.......#..
    #...#.....#.#........##......##
    ...#....##.####.#.........#.#.#
    ....###.#..#............#.#..#.
    ....#......#...#......##.#.#.#.
    .....#..#.#.##.#...##..........
    ##..#...#.#...###.............#
    ....#...#..#.....#.#..#..#..#..
    #..........####......#.....###.
    .........#........#.##.#...#...
    .........#..........#.#..###...
    .....##........##.........#...#
    ..##....#...#.......##.........
    .....#.#......##....#...#...#..
    .##..#..##.....................
    .......#...#..#..#...##....#...
    .#...#.......###...#..#..#.....
    .......#.....##.##.#.......#..#
    .##......#...#....#..#......##.
    .##....#..#....#...#...#.......
    .........##..#..#.#.#.....##...
    ...#..............#..#.....####
    .#.#.#..#.......#.......#......
    ..#.#......#..........#........
    .#...#.#..#.......#..#..#..#...
    .......##.#...#..#....#.....#..
    .##...##....##...#........####.
    ....#.#..##....#...#....#.#....
    .....#.....#..#..#.#.##..#.....
    ..#....#..............#....#...
    ..#.#.#.....##.#.....#..##.....
    ....#.....#....#...#...#..#.#..
    #...#...........#..#..#........
    ...#.#..#.........##.#...#..##.
    ......#.#.........#.#...#......
    ......#..##.###......##.#....#.
    .....#...#..#.......#..........
    .#...#.......#.....###......#..
    ...........##.....#..#..#....#.
    ..#....#..#...#......#.......#.
    ..#...#...#.#..#....#...#......
    .......#....###.####...###.#...
    #.##.#.......#.......#....#.#.#
    .##..........#.....#..###......
    .....#...........#.##..#....#..
    ........##.....#.#........##...
    #..#..#..................##....
    #...###..........#.............
    .......#.#.......#.#.......##..
    .....#.#...#....#...####.....#.
    ..##.....##.......#....#.......
    ##..........#...#..##....##....
    ..........#..#......#........#.
    ##..#....#..#....#.....##....#.
    ##.##.....#...##.##.......#....
    ..#..#.###.#..##.#..#..#...#...
    .#..#.....#........#...##.#....
    ..#..#.....#.#......##.#.#.....
    .#..##...#.#....#...#...#.#.##.
    .........#...#....###.#.....#..
    ...........###.#.#..#..#...#.#.
    ##...#......##...........#..#..
    .........##..#...#.......#.....
    #......#.#..........#..#.......
    ...#.................#....#....
    #....#......................##.
    ##.......#..#......#.#...###.#.
    ..#....#..#.#......#...........
    ...#...........###.#.#.........
    ..#..##.....#.....##...##......
    ..#..#.#.#.#..#..#..##....#...#
    #......##.....##..##.##...#....
    #.....#.....#.#........#.......
    .#.....#.................#....#
    .###....#...#............#.#.#.
    .#...#.#......#.#..............
    ....#...#......#.....#.......#.
    ........#.....#..........#....#
    #..#......#...#...#.........#..
    #....#......#...##.#...#...#...
    #...#....#....#..#..#.....#..#.
    #......##..#..#.#.#..#.#.......
    ..#..#...............#...##...#
    ............#..............#.##
    .#.#.#......##.......#.......#.
    ....#.........##.......#...###.
    .......#.#...#.#.#.......#.....
    ....#..#..#...#....#.##.#.##...
    ...##.##.#...#......#..........
    #.....#...#.#...#.##..##.#.....
    .......#.....#...#.#...##.#....
    .#.............#.....#....##..#
    ##......#.......#...#....#.....
    .###......#.................#..
    #.#......##.........##..#......
    ...#....#..........#.#.........
    ..##..#.........#..............
    .....#...#..................#.#
    .............#.........#...#..#
    ....#....#......#.#.......#...#
    #..#............#.#.......#...#
    ..#.....#............#.........
    .#.....................###....#
    ........#.####.........#.#.#...
    #...........##...#.........#..#
    ...........#..#......#...#.#...
    ....##...##.....#.....#........
    """
)
