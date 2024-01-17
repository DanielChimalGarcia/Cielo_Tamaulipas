import React, { useState } from "react";
//import { v4 as uuidv4 } from "uuid";
import BarraNav from "../components/BarraNav";
import Footer from "../components/Footer";
import "../CSS/Registrarse.css";
import logoCielo from "../assets/images/imagen.webp";
import { API_URL } from "../auth/constans";
import { useNavigate } from "react-router-dom";

const Registro = () => {
  const [nombre, setNombre] = useState("");
  const [ap1, setAp1] = useState("");
  const [ap2, setAp2] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errorResponse, setErrorResponse] = useState("");

  const goTo = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;

    // Validación para evitar caracteres no permitidos
    switch (name) {
      case "nombre":
        if (!value.includes("/") && !value.includes("*")) {
          setNombre(value);
        }
        break;

      case "apellidoPaterno":
        if (!value.includes("/") && !value.includes("*")) {
          setAp1(value);
        }
        break;

      case "apellidoMaterno":
        if (!value.includes("/") && !value.includes("*")) {
          setAp2(value);
        }
        break;

      case "email":
        if (!value.includes("/") && !value.includes("*")) {
          setEmail(value);
        }
        break;

      case "contraseña":
        if (!value.includes("/") && !value.includes("*")) {
          setPassword(value);
        }
        break;
      default:
        console.log("nada");
        break;
    }
  };

  //genera un folio unico
  /*const generarFolioUnico = () => {
    const folio = uuidv4();
    console.log(folio)
    return folio;
  };*/

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(`${API_URL}/signup`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          nombre,
          ap1,
          ap2,
          email,
          password,
        }),
      });

      if (response.ok) {
        console.log("El usuario se creo correctamente");
        setNombre("");
        setAp1("");
        setAp2("");
        setPassword("");
        setEmail("");
        setErrorResponse("");
        goTo("/InicioSecion");
      } else {
        const errorData = await response.json(); // Intenta obtener el cuerpo JSON del error
        console.log("Ocurrió un problema:", errorData.body.error);
        setErrorResponse(errorData.body.error);
      }
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <BarraNav />

      <section
        className="u-clearfix u-image u-shading u-section-1"
        data-image-width="735"
        data-image-height="245"
      >
        <div className="u-clearfix u-sheet u-valign-middle u-sheet-1">
          <div className="u-clearfix u-expanded-width u-gutter-0 u-layout-wrap u-layout-wrap-1">
            <div className="u-layout">
              <div className="u-layout-row">

                
                <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-27-xl u-size-29-lg u-size-29-md  u-size-29-sm u-size-29-xs u-layout-cell-1">
                  <div class="u-container-layout u-valign-top u-container-layout-1">
                    <img
                      class="u-image u-image-contain u-image-default u-image-1"
                      src={logoCielo}
                      alt=""
                      data-image-width="525"
                      data-image-height="425"
                    />
                  </div>
                </div>

                <div className="u-container-style u-layout-cell u-right-cell u-size-31-lg u-size-31-md u-size-31-sm u-size-31-xs u-size-33-xl u-layout-cell-2">
                  <div className="u-container-layout u-container-layout-2">
                    <div className="u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-form u-form-1">
                      <form
                        onSubmit={handleSubmit}
                        className="u-clearfix u-form-spacing-30 u-form-vertical u-inner-form"
                        source="email"
                        name="formName"
                      >
                        <div className="u-form-email u-form-group u-form-partition-factor-2">
                          <label className="u-label u-text-body-alt-color u-label-1">
                            {" "}
                            Nombre
                          </label>
                          <input
                            type="text"
                            placeholder="Introdusca su/s Nombre/s"
                            name="nombre"
                            value={nombre}
                            onChange={handleChange}
                            className="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-white u-input u-input-rectangle"
                          />
                        </div>

                        <div className="u-form-email u-form-group u-form-partition-factor-2">
                          <label className="u-label u-text-body-alt-color u-label-1">
                            {" "}
                            Apellido paterno
                          </label>
                          <input
                            type="text"
                            placeholder="Introdusca su Apellido paterno"
                            name="apellidoPaterno"
                            value={ap1}
                            onChange={handleChange}
                            className="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-white u-input u-input-rectangle"
                          />
                        </div>

                        <div className="u-form-email u-form-group u-form-partition-factor-2">
                          <label className="u-label u-text-body-alt-color u-label-1">
                            {" "}
                            Apellido paterno
                          </label>
                          <input
                            type="text"
                            placeholder="Introdusca su Apellido materno"
                            name="apellidoMaterno"
                            value={ap2}
                            onChange={handleChange}
                            className="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-white u-input u-input-rectangle"
                          />
                        </div>

                        <div className="u-form-address u-form-group u-form-group-3">
                          <label className="u-label u-text-body-alt-color u-label-3">
                            Email/Correo electronico
                          </label>
                          <input
                            type="email"
                            placeholder="Ingrese un correo valido"
                            value={email}
                            onChange={handleChange}
                            className="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-white u-input u-input-rectangle"
                            name="email"
                          />
                        </div>
                        <div className="u-form-address u-form-group u-form-group-3">
                          <label className="u-label u-text-body-alt-color u-label-3">
                            Contraseña
                          </label>
                          <input
                            type="password"
                            placeholder="Cree una contraseña max 20 caracteres"
                            value={password}
                            onChange={handleChange}
                            className="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-white u-input u-input-rectangle"
                            name="contraseña"
                          />
                        </div>

                        {!!errorResponse && (
                          <div className="u-form-address u-form-group u-form-group-3">
                            <label className="u-label u-text-body-alt-color u-label-3">
                              {errorResponse}
                            </label>
                          </div>
                        )}

                        <div className="u-align-left u-form-group u-form-submit">
                          <button
                            type="submit"
                            className="u-active-white u-border-none u-btn u-btn-round u-btn-submit u-button-style u-hover-white u-palette-3-base u-radius-50 u-btn-1"
                          >
                            {" "}
                            Ragistrarse
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </>
  );
};

export default Registro;
