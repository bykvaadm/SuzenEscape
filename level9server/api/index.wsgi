import sys
import logging
import site

site.addsitedir('/usr/local/lib/python3.5/dist-packages/')

logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/var/www/api/src")

# activate_env="/var/www/api/env/bin/activate_this.py"
# from routes import app as application
from main import app as application

maze = Maze(100, 100)
maze.solve_maze()
print(maze)
print("----------------")
print(maze.solutionpath)
print(maze.solutionstr)
print(maze.maze)
