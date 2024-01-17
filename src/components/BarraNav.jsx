import React, { useState } from "react";
import { Link } from "react-router-dom";
import logoCielo from "../assets/images/imagen.webp";
import { useAuth } from "../auth/AuthProvider";
import { borrarCookie } from "../auth/deleteCokies";


function BarraNav() {
  const { isAuthenticate } = useAuth();

  const closSecion = () =>{
    borrarCookie('accessToken')
    borrarCookie('user')
  }
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
            <Link as={Link} to={"/LaViborita"}>
              <img src={logoCielo} className="u-logo-image u-logo-image-1" />
            </Link>
          </div>

          <h2 className="u-custom-font u-font-montserrat u-text u-text-default u-text-1">
            El Cielo{" "}
          </h2>
          <nav>
            <div class="u-custom-menu u-nav-container">
              <ul class="u-nav u-unstyled u-nav-1">
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Inicio
                  </Link>
                </li>
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/partealta"}
                  >
                    Parte alta
                  </Link>
                </li>
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/partebaja"}
                  >
                    Parte baja
                  </Link>
                </li>
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/Mis Reservaciones"}
                  >
                    Mis reservaciones
                  </Link>
                </li>
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    ¿Comó llegar?
                  </Link>
                </li>
                <li class="u-nav-item">
                  <Link
                    className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                    as={Link}
                    to={"/"}
                  >
                    Dudas y Comentarios
                  </Link>
                </li>

                {isAuthenticate ? (
                  <>
                    <li className="u-nav-item">
                      <Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/SecionUsuario"}
                      >
                        Perfil
                      </Link>
                    </li>
                    <li className="u-nav-item">
                      <label
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        onClick={closSecion}
                      >
                        Cerrar Sesión
                      </label>
                    </li>
                  </>
                ) : (
                  <>
                    <li class="u-nav-item">
                      <Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/InicioSecion"}
                      >
                        Iniciar Sesión
                      </Link>
                    </li>
                    <li class="u-nav-item">
                      <Link
                        className="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
                        as={Link}
                        to={"/Registro"}
                      >
                        Registrarse
                      </Link>
                    </li>
                  </>
                )}
              </ul>
            </div>
          </nav>
        </div>
      </header>
    </>
  );
}

export default BarraNav;
