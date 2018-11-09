from flask import Flask, render_template
from maze import *

app = Flask(__name__)
rows = 4
cols = 4

@app.route("/")
@app.route("/index")
def hello():
    current_room = {'id': 0, 'symbol': 'A', 'left': 0, 'right': 0, 'up': 0, 'down': 0}
    x = maze.startrow
    y = maze.startcol
    current_room["id"]=maze.maze[x][y][4]
    current_room["symbol"] = maze.maze[x][y][3]
    if x != 0:
        if not maze.maze[x - 1][y][0]:
            current_room["up"] = maze.maze[x - 1][y][4]
    if not maze.maze[x][y][0]:
        current_room["down"] = maze.maze[x + 1][y][4]
    if y != 0:
        if not maze.maze[x][y - 1][1]:
            current_room["left"] = maze.maze[x][y - 1][4]
    if not maze.maze[x][y][1]:
        current_room["right"] = maze.maze[x][y + 1][4]

    return render_template('room.html', room=current_room)


@app.route("/room")
def room():
    current_room = {'id': 1, 'symbol': 'S', 'left': 100, 'right': 0, 'up': 20, 'down': 0}
    return render_template('room.html', room=current_room)


if __name__ == "__main__":
    maze = Maze(rows, cols)
    maze.solve_maze()
    print(maze)
    print("----------------")
    print(maze.solutionpath)
    print(maze.solutionstr)
    print(maze.maze)
    app.run(host='0.0.0.0', port=80)
