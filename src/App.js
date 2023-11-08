import React, { useState, useEffect } from 'react';
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Error from './Routes/Error';
import Casa from './Routes/Casa';
import Registro from './Routes/Registro';
import InicioSesion from './Routes/InicioSecion';

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
    <div>
      <RouterProvider router={router}/>
    </div>
  );
}


export default App;