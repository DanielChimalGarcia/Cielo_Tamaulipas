import React from "react";
import { Link } from "react-router-dom";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import { Container } from "react-bootstrap";
import logoCielo from "../assets/images/imagen.webp"

function BarraNav() {
  return (
    <>
      <Navbar bg="dark" variant="dark">
        <Container>
            
        </Container>
        <Container>
          <Navbar.Brand>
            <img
              src={logoCielo}
              width="50"
              height="50"
              className="d-inline-block align-top"
              alt="Logo"
            />
            {" Mi cielo Tamaulipas"}
          </Navbar.Brand>
          <Navbar.Brand>
            <Nav.Link as={Link} to={"/"}>
              Inicio
            </Nav.Link>
          </Navbar.Brand>
          <Nav>
            <Nav.Link as={Link} to={"/"}>
              Parte alta
            </Nav.Link>
            <Nav.Link as={Link} to={"/"}>
              Parte baja
            </Nav.Link>
            <Nav.Link as={Link} to={"/"}>
              Hospedaje
            </Nav.Link>
            <Nav.Link as={Link} to={"/"}>
              ¿Comó llegar?
            </Nav.Link>
            <Nav.Link as={Link} to={"/"}>
              Cotizar
            </Nav.Link>
            <Nav.Link as={Link} to={"/InicioSecion"}>
              Iniciar Sesión
            </Nav.Link>
            <Nav.Link as={Link} to={"/Registro"}>
              Registrarse
            </Nav.Link>
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}

export default BarraNav;
