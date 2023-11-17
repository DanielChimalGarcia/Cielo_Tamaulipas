import React, { useState, useEffect } from 'react';
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Error from './Routes/Error';
import Casa from './Routes/Casa';
import Registro from './Routes/Registro';
import InicioSesion from './Routes/InicioSecion';
import "./CSS/nicepage.css"
import "./CSS/Inicio.css"

function App() {
  const router = createBrowserRouter([
    {
      path: "/",
      element: <Casa/>,
      errorElement: <Error/>
    },
    {
      path: "/InicioSecion",
      element: <InicioSesion/>
    },
    {
      path: "/Registro",
      element: <Registro/>
    }
  ])
  return (
    <div className='u-body u-xl-mode'>
      
      <RouterProvider router={router}/>
    </div>
  );
}


export default App;