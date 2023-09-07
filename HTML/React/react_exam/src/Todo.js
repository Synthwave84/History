import "./style.css";
import { useState } from "react";

function Todo() {
  const [id, setId] = useState(0);
  const [todoList, setTodoList] = useState([]);
  const [createTodoValue, setCreateTodoValue] = useState("");

  return (
    <div className="todoapp">
      <h1>todo</h1>
      <input type="text" onChange={(event) => {
        setCreateTodoValue(event.target.value);
      }} />
      <button type="button" onClick={() => {
        setTodoList([...todoList, { 
          id: id + 1,
          value: createTodoValue,
          completed: false
        }]);
        setId(id + 1);
        setCreateTodoValue("");
      }} >작성</button>
      <button type="button" onClick={() => {
        console.log("id", id);
        console.log("todoList", todoList);
        console.log("createTodoValue", createTodoValue);
      }}>체크</button>
      <main>
        <ul>
          {
            todoList.map(todo => {
              return (
                <div className={todo.completed ? "completed" : "active"} key={todo.id}>
                  <button type="button" onClick={() => {
                    setTodoList(todoList.map(targetTodo => {
                      if (targetTodo.id !== todo.id) {
                        return targetTodo;
                      }

                      return {
                        ...targetTodo,
                        completed: !targetTodo.completed
                      }
                    }))
                  }}>
                    {
                      todo.completed ? "함" : "아직 안함"
                    }
                  </button>
                  <p>{todo.value}</p>
                  <button type="button" onClick={() => {
                    setTodoList(todoList.filter(({id}) => id !== todo.id))
                  }}>삭제</button>
                </div>
              )
            })
          }
        </ul>
      </main>
    </div>
  )
}

export default Todo;