import maze
from maze import *
# from main import rows, cols, maze, app as application
from main import rows, cols, maze, app as application

maze = Maze(100, 100)
maze.solve_maze()
print(maze)
print("----------------")
print(maze.solutionpath)
print(maze.solutionstr)
print(maze.maze)
