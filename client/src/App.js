import React from 'react';
import {BrowserRouter as Router, Route, Routes} from 'react-router-dom';
import './App.css';
import Home from './pages/Home';
import New from './pages/New';
import Show from './pages/Show';
import Header from "./components/Header";

function NotFound() {
    return (<>You have landed on a page that doesn't exist</>);
}

function App() {
  return (
      <Router>
          <Header />
          <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/new" element={<New />} />
              <Route path="/asks/:id" element={<Show />} />
              <Route path="*" element={<NotFound />}></Route>
          </Routes>
      </Router>
  );
}

export default App;
