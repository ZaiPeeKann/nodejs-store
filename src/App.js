import {BrowserRouter} from "react-router-dom";
import React from "react";
import AppRouter from "./components/AppRouter";
import NavBar from "./components/NavBar";
import classes from "./styles/App.module.css";

function App() {
  return (
    <BrowserRouter>
      <div className={classes.wrapper}>
        <NavBar/>
        <AppRouter/>
      </div>
    </BrowserRouter>
  );
}

export default App;
