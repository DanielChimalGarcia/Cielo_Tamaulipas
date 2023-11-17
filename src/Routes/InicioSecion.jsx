import React, { useState } from "react";
import { Link } from "react-router-dom";
import Nav from "react-bootstrap/Nav";
import { Form, Button, Col, Row, Container } from "react-bootstrap";
import BarraNav from "../components/BarraNav";
import Footer from "../components/Footer";

const InicioSesion = () => {
  const [formData, setFormData] = useState({
    email: "",
    contraseña: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Aquí puedes manejar la lógica de inicio de sesión utilizando los datos en formData
    console.log("Datos de inicio de sesión:", formData);
  };

  return (
    <>
      <BarraNav />
      <Container>
        <Row className="justify-content-md-center">
          <Col md={6}>
            <Form onSubmit={handleSubmit}>
              <Form.Group controlId="email">
                <Form.Label>Correo Electrónico</Form.Label>
                <Form.Control
                  type="email"
                  name="email"
                  value={formData.email}
                  onChange={handleChange}
                  required
                />
              </Form.Group>

              <Form.Group controlId="contraseña">
                <Form.Label>Contraseña</Form.Label>
                <Form.Control
                  type="password"
                  name="contraseña"
                  value={formData.contraseña}
                  onChange={handleChange}
                  required
                />
              </Form.Group>

              <Form.Group>
                <Form.Text className="text-muted">
                  <a href="#olvidaste-contraseña">¿Olvidaste tu contraseña?</a>
                </Form.Text>
              </Form.Group>

              <Button variant="primary" type="submit">
                Iniciar Sesión
              </Button>
            </Form>
          </Col>
        </Row>
        <Nav.Link as={Link} to={"/Registro"}>
          Registrarse
        </Nav.Link>
      </Container>
      <Footer />
    </>
  );
};

export default InicioSesion;
