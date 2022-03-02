final int col = 5;
final int row = 5;

Cell[][] Grid = new Cell[col][col];
Arraylist<Cell> Alive = new ArrayList<Cell>()

PVector getPoint(PVector point) {
    final int x = floor(point.x > 0 ? point.x : col + point.x) % col;
    final int y = floor(point.y > 0 ? point.y : row + point.y) % row;
    return new PVector(x, y);
}


void setup() {
    Alive.add(new Cell(rand))
    size(1000, 1000);
    int cellWidth = width / col;
    int cellHeight = height / row;
    for(int i = 0; i < col; i++) {
        for(int j = 0; j < row; j++) {
            Grid[i][j] = new Cell(i * cellWidth, j * cellHeight - 2, cellWidth - 2, cellHeight - 2, color(0), color(255));
            Grid[i][j].show();
        }
    }
}

void draw() {

}