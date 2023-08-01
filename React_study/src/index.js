import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import Book from './chapter_03/Book'
import Library from './chapter_03/Library';
import Clock from './chapter_04/Clock';
import TestApp from './chapter_04/TestApp';
import reportWebVitals from './reportWebVitals';
import ComponentList from './chapter_05/ComponentList';
import Employee from './chapter_05/Employee';
import EmplolyeeList from './chapter_05/EmployeeList';
import Hello from './chapter_05/Hello';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render (
  <React.StrictMode>
    <EmplolyeeList />
    <Hello />
</React.StrictMode>
)

/*
setInterval(() => {
  root.render(
<React.StrictMode>
    <Clock />
  </React.StrictMode>
  );
}, 1000);
*/



// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
