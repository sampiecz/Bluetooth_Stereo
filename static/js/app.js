import React from 'react'
import ReactDOM from 'react-dom'
import Connect from './connect/connect.js'

function App() {
  return (
    <>
      <Connect />
    </>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('react')
);
