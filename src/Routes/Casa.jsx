import React from "react";
import BarraNav from "../components/BarraNav";
import { Container } from "react-bootstrap";
import img1 from "../assets/imagenes/prueba.webp"

function Casa() {
  return (
    <div>
      <BarraNav />
      <Container
        className="d-flex flex-column justify-content-center align-items-center"
        style={{ minHeight: "100vh" }}
      >
        <h1>Mi Cielo tamaulipas</h1>
        <img
          src={img1}
          width="960"
          height="540"
          className="d-inline-block align-top"
          alt="Logo"
        />
        <img
          src={img1}
          width="960"
          height="540"
          className="d-inline-block align-top"
          alt="Logo"
        />
      </Container>
    </div>
  );
}

export default Casa;
