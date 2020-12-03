import UIKit

/*
 * Day 3: Toboggan Trajectory
 */

class Solution {
    
    var x: Int = 0
    
    func result(_ input: String) -> Int {
        var count: Int = 0
        
        let rows = input.components(separatedBy: "\n")
        guard let columns = rows.first?.count else {
            fatalError("Input is invalid")
        }
        
        for row in rows {
            let c = row[row.index(row.startIndex, offsetBy: x)]
            if c == "#" {
                count += 1
            }
            x += 3
            if x >= columns {
                x -= columns
            }
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
