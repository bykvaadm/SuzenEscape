from flask import Flask, render_template, request
from maze import *

rows = 100
cols = 100
app = Flask(__name__)
maze = Maze(rows, cols)

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
    id = request.args.get("id")
    if id != None:
        for x in range(rows):
            for y in range(cols):
                if id == maze.maze[x][y][4]:
                    current_room = {'id': 0, 'symbol': 'A', 'left': 0, 'right': 0, 'up': 0, 'down': 0}
                    current_room["id"] = maze.maze[x][y][4]
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
                    if x == maze.endrow and y == maze.endcol:
                        return render_template('finish.html', room=current_room)
                    else:
                        return render_template('room.html', room=current_room)
    return render_template('error.html')


@app.route("/key")
def key():
    str = request.args.get("path")
    if str != None:
        if str == maze.solutionstr:
            return render_template('key.html')
    return render_template('error.html')

@app.before_first_request
def befire_startup():
    maze.solve_maze()
    print(maze)
    print("----------------")
    print(maze.solutionstr)

if __name__ == "__main__":

    app.run(host='0.0.0.0', port=80)
