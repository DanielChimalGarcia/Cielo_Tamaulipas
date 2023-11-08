import React, { useState, useEffect } from 'react';

function App() {
  const [datos, setDatos] = useState([]);

  useEffect(() => {
    // En este ejemplo, la consulta es 'SELECT * FROM foco_prueba'
    const consulta = encodeURIComponent(`CALL insertar_cabaña (111,'PRUEBA4','PRUEBA',2133,'PRUEBA','PRUEBA','PRUEBA',1)`);

    // Hacer la solicitud a la API cuando el componente se monta
    fetch(`http://localhost:3001/api/${consulta}`)
      .then(response => response.json())
      .then(data => {
        // Actualizar el estado con los datos de la base de datos
        setDatos(data);
      })
      .catch(error => console.error('Error:', error));
  }, []); // El array vacío asegura que useEffect solo se ejecute una vez al montar el componente
  console.log(`dato ${JSON.stringify(datos, null,2)}`)
  return (
    <div>
      <h1>Datos de la base de datos:</h1>
        <thead>
          <tr>
            <th>resultado</th>
          </tr>
        </thead>
        <tbody>
            <tr>
              <th>{datos[0][0].result}</th>
            </tr>
        </tbody>
    </div>
  );
}


export default App;