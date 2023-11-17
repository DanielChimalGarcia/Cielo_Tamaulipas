import React from "react";
import { Link } from "react-router-dom";
import Nav from "react-bootstrap/Nav";
import logoCielo from "../assets/images/imagen.webp";

function BarraNav() {
  return (
    <>
      <header
        className="u-border-2 u-border-palette-1-light-1 u-clearfix u-header u-image u-shading u-header"
        data-image-width="1920"
        data-image-height="1080"
        data-animation-name=""
        data-animation-duration="0"
        data-animation-delay="0"
        data-animation-direction=""
      >
        <div className="u-clearfix u-sheet u-sheet-1">
          <div className="u-image u-logo u-image-1">
            <img src={logoCielo} className="u-logo-image u-logo-image-1" />
          </div>
          
          <h2 className="u-custom-font u-font-montserrat u-text u-text-default u-text-1">
            El Cielo </h2>
          <nav >
            <div class="u-custom-menu u-nav-container">
              <ul class="u-nav u-unstyled u-nav-1">
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Inicio
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Parte alta
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Parte baja
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Hospedaje
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    ¿Comó llegar?
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Cotizar
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/InicioSecion"}
                  >
                    Iniciar Sesión
                  </Nav.Link>
                </li>
                <li class="u-nav-item">
                  <Nav.Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/Registro"}
                  >
                    Registrarse
                  </Nav.Link>
                </li>
              </ul>
            </div>

            <div className="u-custom-menu u-nav-container-collapse">
              <div className="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                <div className="u-inner-container-layout u-sidenav-overflow">
                  <div className="u-menu-close"></div>
                  <ul className="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        Inicio
                      </Nav.Link>
                    </li>

                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        Parte alta
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        Parte baja
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        Hospedaje
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        ¿Comó llegar?
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/"}
                      >
                        Cotizar
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/InicioSecion"}
                      >
                        Iniciar Sesión
                      </Nav.Link>
                    </li>
                    <li className="u-nav-item">
                      <Nav.Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/Registro"}
                      >
                        Registrarse
                      </Nav.Link>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </header>
    </>
  );
}

export default BarraNav;
