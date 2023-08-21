import counterSlice from "./counterSlice";
import { configureStore } from "@reduxjs/toolkit";

const store = configureStore ({
  reducer : { // 여긴또 안들어간다 지 맘대로다 아주
                counter : counterSlice.reducer}
});


export default store;