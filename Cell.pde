class Cell {
    PVector position;
    int width;
    int height;
    int suroundedByAlive = 0;
    boolean isAlive = false;
    color colour;
    color strokeColor;
    Cell(int x, int y, int Width, int Height, color Colour, color strokecolor, boolean IsAlive) {
        position = new PVector(x, y);
        width = Width - 2;
        height = Height - 2;
        colour = Colour;
        strokeColor = strokecolor;
        isAlive = IsAlive;
    }
    Cell(Cell cell) {
        position = cell.position;
        width = cell.width;
        height = cell.height;
        colour = cell.colour;
        isAlive = cell.isAlive;
    }
    void show() {
        stroke(strokeColor);
        fill(colour);
        rect(position.x, position.y, width, height);
    }
}