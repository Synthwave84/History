import React from "react";
import store from "./store";
import { Provider } from "react-redux";
import Counter from "./Counter";






function App() {
  return (
    <div>
      <Provider store={store}>
      <Counter>
      </Counter>
      </Provider>
  
    </div>
  );
}

export default App;
