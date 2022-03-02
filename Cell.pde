class Cell {
    PVector position;
    int width;
    int height;
    color colour;
    color strokeColor;
    Cell(int x, int y, int Width, int Height, color Colour, color strokecolor) {
        position = new PVector(x, y);
        width = Width;
        height = Height;
        colour = Colour;
        strokeColor = strokecolor;
    }
    
    void show() {
        stroke(strokeColor);
        fill(colour);
        rect(position.x, position.y, width, height);
    }
}