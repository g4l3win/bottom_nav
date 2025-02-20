https://blog.devgenius.io/lets-create-a-snake-game-using-flutter-and-flame-38482d3cf0ff

class GameConfig {

  // Defines the number of rows in the grid
  static const rows = 24;

  // Defines the number of columns in the grid
  static const columns = 12;

  // Cell size in px
  static const cellSize = 32;
}

class SnakeGame extends FlameGame {
  OffSets offSets = OffSets(Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    offSets = OffSets(canvasSize);
  }
}

class OffSets {
  Vector2 start = Vector2.zero();
  Vector2 end = Vector2.zero();

  OffSets(Vector2 canvasSize) {
    var gameAreaX = GameConfig.cellSize * GameConfig.columns;
    var gameAreaY = GameConfig.cellSize * GameConfig.rows;

    start = Vector2((canvasSize.x - gameAreaX) / 2, (canvasSize.y - gameAreaY) / 2);
    end = Vector2(canvasSize.x - start.x, canvasSize.y - start.y);
  }
}

class BackGround extends PositionComponent with HasGameRef<SnakeGame> {

  Offset start = Offset.zero;
  Offset end = Offset.zero;

  final int cellSize;

  BackGround(this.cellSize);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    start = gameRef.offSets.start.toOffset();
    end = gameRef.offSets.end.toOffset();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromPoints(start, end), Styles.white);
    _drawVerticalLines(canvas);
    _drawHorizontalLines(canvas);
  }

  void _drawVerticalLines(Canvas c) {
    for (double x = start.dx; x <= end.dx; x += cellSize) {
      c.drawLine(Offset(x, start.dy), Offset(x, end.dy), Styles.blue);
    }
  }

  void _drawHorizontalLines(Canvas c) {
    for (double y = start.dy; y <= end.dy; y += cellSize) {
      c.drawLine(Offset(start.dx, y), Offset(end.dx, y), Styles.blue);
    }
  }
}

class SnakeGame extends FlameGame {

  OffSets offSets = OffSets(Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    offSets = OffSets(canvasSize);

    add(BackGround(GameConfig.cellSize));
  }
}

void main() {
  runApp(
    GameWidget(
      game: SnakeGame(),
    ),
  );
}

class Grid {
  final int _rows;
  final int _columns;

  List<List<Cell>> _cells = List.empty(growable: true);

  List<List<Cell>> get cells => _cells;

  Grid(this._rows, this._columns, int cellSize) {
    _cells = List.generate(
        _rows,
        (row) => List.generate(
            _columns,
            (column) =>
                Cell(Vector2(row.toDouble(), column.toDouble()), cellSize),
            growable: false),
        growable: false);
  }

  Cell findCell(int column, int row) {
    try {
      return _cells[row][column];
    } on RangeError {
      return border;
    }
  }
}

enum CellType { empty, snakeBody }

class Cell extends PositionComponent with HasGameRef<SnakeGame> {

  static Cell zero = Cell(Vector2(0, 0), 0);

  final Vector2 _index;
  final int _cellSize;
  CellType cellType;
  Vector2 _location = Vector2.zero();

  int get row => _index.x.toInt();
  int get column => _index.y.toInt();
  Vector2 get index => _index;
  Vector2 get location => _location;

  Cell(this._index, this._cellSize, {this.cellType = CellType.empty});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    var start = gameRef.offSets.start;
    _location = Vector2(
        column * _cellSize + start.x, row * _cellSize + start.y);
  }

  @override
  void render(Canvas canvas) {
    // TODO get rid of switch by making the cell type an object and directly call render on it.
    switch (cellType) {
      case CellType.snakeBody:
        SnakeBody.render(canvas, _location, _cellSize);
        break;
      case CellType.empty:
        break;
    }
  }
}

class SnakeBody {

  static void render(Canvas canvas, Vector2 location, int cellSize) {
    canvas.drawRect(
        Rect.fromPoints(
            findStart(location, cellSize), findEnd(location, cellSize)),
        Styles.snakeBody);
  }

  static Offset findStart(Vector2 location, int cellSize) {
    return Offset(location.x + GameConfig.snakeLineThickness / 2,
        location.y + GameConfig.snakeLineThickness / 2);
  }

  static Offset findEnd(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize - GameConfig.snakeLineThickness / 2,
        location.y + cellSize - GameConfig.snakeLineThickness / 2);
  }
}

class Snake {

  final LinkedList<SnakeBodyPart> snakeBody = LinkedList();

  Cell head = Cell.zero;

  void setHead(Cell cell) {
    head = cell;
  }

  void addCell(Cell cell) {
    _add(SnakeBodyPart.fromCell(cell));
  }

  void _add(SnakeBodyPart part) {
    snakeBody.add(part);
  }

  void _addFirst(Cell cell) {
    snakeBody.addFirst(SnakeBodyPart.fromCell(cell));
  }

  void _removeLast() {
    snakeBody.last.cell.cellType = CellType.empty;
    snakeBody.remove(snakeBody.last);
  }
}

class World extends Component {
  final Grid _grid;
  final Snake _snake = Snake();

  World(this._grid) {
    _initializeSnake();
  }

  void _initializeSnake() {
    var headIndex = GameConfig.headIndex;
    var snakeLength = GameConfig.initialSnakeLength;

    for (int i = 0; i < snakeLength; i++) {
      var snakePart =
          _grid.findCell(headIndex.x.toInt() - i, headIndex.y.toInt());
      _snake.addCell(snakePart);
      if (i == 0) {
        _snake.setHead(snakePart);
      }
    }
  }
}

class SnakeGame extends FlameGame {
  Grid grid = Grid(GameConfig.rows, GameConfig.columns, GameConfig.cellSize);
  World? world;
  OffSets offSets = OffSets(Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    offSets = OffSets(canvasSize);

    add(BackGround(GameConfig.cellSize));
    grid.cells.forEach((rows) => rows.forEach((cell) => add(cell)));

    world = World(grid);
    add(world!);
  }
}

void generateFood() {
    var allCells = _cells.expand((element) => element).toList();
    var emptyCells = allCells
        .where((element) => element.cellType == CellType.empty)
        .toList();
    emptyCells[Random().nextInt(emptyCells.length)].cellType = CellType.food;
  }

class Food {

  static void render(Canvas canvas, Vector2 location, int cellSize) {
    canvas.drawCircle(
        findMiddle(location, cellSize), findRadius(cellSize), Styles.red);
  }

  static Offset findMiddle(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize / 2, location.y + cellSize / 2);
  }

  static double findRadius(int cellSize) {
    return cellSize / 2 - GameConfig.foodRadius;
  }
}

oid move(Cell nextCell) {
    _removeLast();
    head = nextCell;
    _addFirst(head);
  }

abstract class DynamicFpsPositionComponent extends PositionComponent {

  double _fps = 60;
  double _targetDt = 1 / 60;
  double _dtTotal = 0;

  DynamicFpsPositionComponent(double fps) {
    setFps(fps);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _dtTotal += dt;

    if (_dtTotal >= _targetDt) {
      _dtTotal = 0;
      updateDynamic(dt);
    }
  }

  void updateDynamic(double dt);

  void setFps(double fps) {
    _fps = fps;
    _targetDt = 1 / _fps;
  }
}

class CommandQueue {
  final List<Vector2> touches = [];

  add(Vector2 touchPoint) {
    if (touches.length != 3) {
      touches.add(touchPoint);
    }
  }

  void evaluateNextInput(Snake snake) {
    if (touches.isNotEmpty) {
      var touchPoint = touches[0];
      touches.remove(touchPoint);

      var delta = snake.displacementToHead(touchPoint);

      snake.direction = snake.isHorizontal()
          ? delta.y < 0
              ? Direction.up
              : Direction.down
          : delta.x < 0
              ? Direction.left
              : Direction.right;
    }
  }
}

class SnakeGame extends FlameGame with TapDetector {
  World? world;

  @override
  void onTapUp(TapUpInfo info) {
    world!.onTapUp(info);
  }
}

class World extends DynamicFpsPositionComponent with HasGameRef<SnakeGame> {
  ...
  final CommandQueue _commandQueue = CommandQueue();

  ...

  @override
  void updateDynamic(double dt) {
    if (!gameOver) {
      _commandQueue.evaluateNextInput(_snake);
    }
  }

  void onTapUp(TapUpInfo info) {
    final touchPoint = info.eventPosition.game;
    _commandQueue.add(touchPoint);
  }
}

void grow(Cell nextCell) {
    head = nextCell;
    _addFirst(head);
  }

@override
  void updateDynamic(double dt) {
    if (!gameOver) {
      _commandQueue.evaluateNextInput(_snake);

      var nextCell = _getNextCell();

      if (nextCell != Grid.border) {
        if (_snake.checkCrash(nextCell)) {
          gameOver = true;
        } else {
          if (nextCell.cellType == CellType.food) {
            _snake.grow(nextCell);
            _grid.generateFood();
          } else {
            _snake.move(nextCell);
          }
        }
      } else {
        gameOver = true;
      }
    }
  }

