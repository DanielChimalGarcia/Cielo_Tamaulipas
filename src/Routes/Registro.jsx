import React, { useState } from "react";
import { Form, Button } from "react-bootstrap";
import {v4 as uuidv4} from "uuid"
import BarraNav from "../components/BarraNav";

const Registro = () => {
  const [datos, setDatos] = useState([]);
  const [formData, setFormData] = useState({
    nombre: "",
    apellidoPaterno: "",
    apellidoMaterno: "",
    telefono: "",
    direccion: "",
    curp: "",
    erefc: "",
    email: "",
    contraseña: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;

    // Validación para evitar caracteres no permitidos
    if (!value.includes("/") && !value.includes("*")) {
      setFormData({
        ...formData,
        [name]: value,
      });
    }
  };

  //genera un folio unico
  const generarFolioUnico = () => {
    const folio = uuidv4();
    return folio;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const folio = generarFolioUnico();
    console.log(folio)
    const consulta = encodeURIComponent(
      `CALL insertar_cliente('${folio}','${formData.nombre}','${formData.apellidoPaterno}','${formData.apellidoMaterno}','${formData.telefono}','${formData.direccion}','${formData.curp}','${formData.erefc}','${formData.email}','${formData.contraseña}')`
    );
    fetch(`http://localhost:3001/api/${consulta}`)
      .then((response) => response.json())
      .then((data) => {
        // Actualizar el estado con los datos de la base de datos
        setDatos(data);
      })
      .catch((error) => console.error("Error:", error));
    console.log("Datos enviados:", formData);
  };

  return (
    <>
    <BarraNav/>
    <Form onSubmit={handleSubmit}>
      <Form.Group controlId="nombre">
        <Form.Label>Nombre</Form.Label>
        <Form.Control
          type="text"
          name="nombre"
          value={formData.nombre}
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group controlId="apellidoPaterno">
        <Form.Label>Apellido Paterno</Form.Label>
        <Form.Control
          type="text"
          name="apellidoPaterno"
          value={formData.apellidoPaterno}
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group controlId="apellidoMaterno">
        <Form.Label>Apellido Materno</Form.Label>
        <Form.Control
          type="text"
          name="apellidoMaterno"
          value={formData.apellidoMaterno}
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group controlId="telefono">
        <Form.Label>Número de Teléfono</Form.Label>
        <Form.Control
          type="number"
          name="telefono"
          value={formData.telefono}
          onChange={handleChange}
        />
      </Form.Group>
      <Form.Group controlId="direccion">
        <Form.Label>Direccion</Form.Label>
        <Form.Control
          type="text"
          name="direccion"
          value={formData.direccion}
          onChange={handleChange}
        />
      </Form.Group>
      <Form.Group controlId="curp">
        <Form.Label>CURP</Form.Label>
        <Form.Control
          type="text"
          name="curp"
          value={formData.curp}
          onChange={handleChange}
        />
      </Form.Group>
      <Form.Group controlId="erefc">
        <Form.Label>RFC</Form.Label>
        <Form.Control
          type="text"
          name="erefc"
          value={formData.erefc}
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group controlId="email">
        <Form.Label>E-Mail</Form.Label>
        <Form.Control
          type="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
        />
      </Form.Group>

      <Form.Group controlId="contraseña">
        <Form.Label>Contraseña</Form.Label>
        <Form.Control
          type="password"
          name="contraseña"
          value={formData.contraseña}
          onChange={handleChange}
        />
      </Form.Group>

      <Button variant="primary" type="submit">
        Registrarse
      </Button>
    </Form>
    </>
  );
};

export default Registro;
