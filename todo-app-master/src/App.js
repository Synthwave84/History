
import './style.css';

function App() {
  return (
    <div className="todoapp">
    <h1>Todo List</h1>
    <input id="new-todo-title"  className="new-todo"></input>
    <main>
      <input className="toggle-all" type="checkbox"/>
      <ul id="todo-list" className="todo=list"></ul>
      <div className="count-container">
        <span className="todo-count">총 <strong>0</strong>개</span>
        <ul className="filters">
          <li>
            <a className="all selected" href="#">해야 할 일</a>
          </li>
          <li>
            <a className="active" href="#">전체 보기</a>
          </li>
          <li>
            <a className="completed" href="#">완료한 일</a>
          </li>
        </ul>
      </div>
    </main>
    </div>

  );
}

export default App;
