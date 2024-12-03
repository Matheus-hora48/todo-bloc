import 'dart:async';
import '../../domain/usecases/usecases.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc {
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;
  final GetTasks getTasks;

  final _stateController = StreamController<TodoState>();
  final _eventController = StreamController<TodoEvent>();

  Stream<TodoState> get state => _stateController.stream;
  Sink<TodoEvent> get eventSink => _eventController.sink;

  TodoState get initialState => TodoInitial();

  TodoBloc({
    required this.addTask,
    required this.updateTask,
    required this.deleteTask,
    required this.getTasks,
  }) {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TodoEvent event) async {
    if (event is AddTaskEvent) {
      await _handleAddTask(event);
    } else if (event is UpdateTaskEvent) {
      await _handleUpdateTask(event);
    } else if (event is DeleteTaskEvent) {
      await _handleDeleteTask(event);
    } else if (event is LoadTasksEvent) {
      await _handleLoadTasks();
    }
  }

  Future<void> _handleAddTask(AddTaskEvent event) async {
    _stateController.add(TodoLoading());
    try {
      await addTask(event.task);
      await _handleLoadTasks();
    } catch (e) {
      _stateController.add(TodoError(e.toString()));
    }
  }

  Future<void> _handleUpdateTask(UpdateTaskEvent event) async {
    _stateController.add(TodoLoading());
    try {
      await updateTask(event.task);
      await _handleLoadTasks();
    } catch (e) {
      _stateController.add(TodoError(e.toString()));
    }
  }

  Future<void> _handleDeleteTask(DeleteTaskEvent event) async {
    _stateController.add(TodoLoading());
    try {
      await deleteTask(event.taskId);
      await _handleLoadTasks();
    } catch (e) {
      _stateController.add(TodoError(e.toString()));
    }
  }

  Future<void> _handleLoadTasks() async {
    _stateController.add(TodoLoading());
    try {
      final tasks = await getTasks();
      _stateController.add(TodoLoaded(tasks));
    } catch (e) {
      _stateController.add(TodoError(e.toString()));
    }
  }

  void dispatch(TodoEvent event) {
    _eventController.add(event);
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
