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
        width = Width;
        height = Height;
        colour = Colour;
        strokeColor = strokecolor;
        isAlive = IsAlive;
    }
    
    void show() {
        stroke(strokeColor);
        fill(colour);
        rect(position.x, position.y, width, height);
    }
}