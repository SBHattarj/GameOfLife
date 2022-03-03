final int col = 2;
final int row = 2;
int cellWidth;
int cellHeight;
boolean started = false;

Cell[][] Grid = new Cell[col][row];
ArrayList<Cell> Alive = new ArrayList<Cell>();

PVector getPoint(PVector point) {
    final int x = floor(point.x > 0 ? point.x : col + point.x) % col;
    final int y = floor(point.y > 0 ? point.y : row + point.y) % row;
    return new PVector(x, y);
}


void setup() {
    size(1000, 1000);
    cellWidth = width / col;
    cellHeight = height / row;
    for(int i = 0; i < col; i++) {
        for(int j = 0; j < row; j++) {
            int x = i * cellWidth;
            int y = j * cellHeight;
            Grid[i][j] = new Cell(x, 
            y, 
            cellWidth - 2, 
            cellHeight - 2, 
            color(0), 
            color(255),
            false
        );
            Grid[i][j].show();
        }
    }
}

void keyPressed() {
    if(key == ' ') {
        started = true;
    }
}

void mouseClicked() {
    int i = floor(mouseX / cellWidth);
    int j = floor(mouseY / cellHeight);
    if(Grid[i][j].isAlive) return;
    Grid[i][j].isAlive = true;
    Cell newAlive = new Cell(
        floor(Grid[i][j].position.x),
        floor(Grid[i][j].position.y),
        Grid[i][j].width,
        Grid[i][j].height,
        color(0, 255, 0),
        color(255),
        true
    );
    newAlive.show();
    Alive.add(newAlive);
}
void draw() {
    frameRate(1);
    if(Alive.size() == 0) {
        println("loop");
        started = false;
        return;
    }
    println(Alive)
    if(!started) return;
    Cell[][] CurrentGrid = new Cell[col][row];
    for(int i = 0; i < col; i++) {
        for(int j = 0; j < row; j++) {
            CurrentGrid[i][j] = new Cell(Grid[i][j]);
        }
    }
    ArrayList<Cell> NewAlive = new ArrayList<Cell>();
    for(Cell alive : Alive) {
        alive.show();
        for(int i = -1; i <= 1; i++) {
            for(int j = -1; j <= 1; j++){
                if (i == 0 && j == 0) continue;
                PVector pos = getPoint(
                    new PVector(
                        (floor(alive.position.x / cellHeight) + i),
                        (floor(alive.position.y / cellWidth) + j)
                    )
                );
                int x = floor(pos.x);
                int y = floor(pos.y);
                ++CurrentGrid[x][y].suroundedByAlive;
                if(Grid[x][y].isAlive) {
                    ++alive.suroundedByAlive;
                    continue;
                }
                if(CurrentGrid[x][y].suroundedByAlive < 3) continue;
                if(CurrentGrid[x][y].isAlive) continue;
                CurrentGrid[x][y].isAlive = true;
                Cell curCell = CurrentGrid[x][y];
                Cell allCell = new Cell(
                    floor(curCell.position.y),
                    floor(curCell.position.x),
                    curCell.width,
                    curCell.height,
                    color(0, 255, 0),
                    color(255),
                    true
                );
                NewAlive.add(allCell);
                allCell.show();
            }
        }
        if(alive.suroundedByAlive > 4 || alive.suroundedByAlive < 1) {
            int x = floor(alive.position.x / cellWidth);
            int y = floor(alive.position.y / cellHeight);
            Grid[x][y].show();
        }
        NewAlive.add(alive);
    }
    Grid = CurrentGrid;
    Alive = NewAlive;
}