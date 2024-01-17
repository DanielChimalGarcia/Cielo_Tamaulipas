import React, { useEffect, useState } from "react";
import { v4 as uuidv4 } from "uuid";
import { obtenerDatos } from "../auth/GetData";
//import "../CSS/editcabana.css";
import "react-datepicker/dist/react-datepicker.css";
import DatePicker from "react-datepicker";
import { API_URL } from "../auth/constans";

function FomrClient({ precioCab, clabeCab, onclose, fechas }) {
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [nights, setNights] = useState(0);
  const [precioReal, setPrecioReal] = useState(0);
  const [price, setPrice] = useState(0);
  const [clvB, setClvB] = useState("");
  const [blockedDates, setBlockedDates] = useState([]);
  const today = new Date();

  const [startYear, setStartYear] = useState("");
  const [startMonth, setStartMonth] = useState("");
  const [startDay, setStartDay] = useState("");

  const [endYear, setEndYear] = useState("");
  const [endtMonth, setEndMonth] = useState("");
  const [endtDay, setEndDay] = useState("");

  const [curp, setCurp] = useState("");
  const [results, setResults] = useState([{ result: "" }]);
  const [folioClient, setFolioClient] = useState("");
  const [dataClient, setDataClient] = useState({
    nombre: "",
    ap1: "",
    ap2: "",
    telefono: "",
    direccion: "",
    rfc: "",
    email: "",
  });

  const handleStartDateChange = (date) => {
    setStartDate(date);
    console.log(`fecha de entrada: ${date}`)
    setStartYear(date.getFullYear());
    setStartMonth((date.getMonth() + 1).toString().padStart(2, "0")); // Agrega cero a la izquierda si es necesario
    setStartDay(date.getDate().toString().padStart(2, "0")); // Agrega cero a la izquierda si es necesario
    calculateNightsAndPrice(date, endDate);
  };

  const handleEndDateChange = (date) => {
    setEndDate(date);
    setEndYear(date.getFullYear());
    setEndMonth((date.getMonth() + 1).toString().padStart(2, "0")); // Agrega cero a la izquierda si es necesario
    setEndDay(date.getDate().toString().padStart(2, "0")); // Agrega cero a la izquierda si es necesario
    calculateNightsAndPrice(startDate, date);
  };

  const calculateNightsAndPrice = (start, end) => {
    if (start && end) {
      const nightsDifference = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
      setNights(nightsDifference);
      const totalPrice = nightsDifference * precioReal;
      setPrice(totalPrice);
    }
  };

  const handleCurpCheck = async () => {
    try {
      const cons = `CALL compCurp ('${curp}')`;
      const comp = await obtenerDatos(cons);

      setResults(comp[0]);
      //console.log(`resultado ${JSON.stringify(results, null,2)}`)
      //console.log(`resultado ${results[0].result}`);
    } catch (error) {
      console.error("Error al verificar CURP:", error);
    }
    setPrecioReal(parseFloat(precioCab));
    setClvB(clabeCab);
    setBlockedDates(fechas)
    console.log(blockedDates)
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCurp(value);
  };
  const handleChange2 = (e) => {
    const { name, value } = e.target;
    setDataClient({
      ...dataClient,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setFolioClient(uuidv4());
    try {
      console.log(folioClient);
      const reg = `call insertar_cliente('${uuidv4()}','${
        dataClient.nombre
      }','${dataClient.ap1}','${dataClient.ap2}','${dataClient.telefono}','${
        dataClient.direccion
      }','${curp}','${dataClient.rfc}','${dataClient.email}')`;
      await obtenerDatos(reg);
    } catch (error) {
      console.error("Error:", error);
    }

    handleCurpCheck();
  };

  const handleSubmitRes = async (e) => {
    e.preventDefault();
    setFolioClient(uuidv4());
    const folioreserv = Date.now();
    try {
      console.log(folioClient);
      const reg = `call hacer_reservacion('${folioreserv}','${curp}','${clvB}','${startYear}-${startMonth}-${startDay}','${endYear}-${endtMonth}-${endtDay}','${price}')`;
      await obtenerDatos(reg);
    } catch (error) {
      console.error("Error:", error);
    }

    handleCurpCheck();
  };

  const isDateBlocked = (date) => {
    return blockedDates.some((block) => {
      const blockStartDate = new Date(block.Fecha_Entrada);
      const blockEndDate = new Date(block.Fecha_Salida);
      return date >= blockStartDate && date <= blockEndDate;
    });
  };

  return (
    <>
      <section>
        <div className="registro-caban">
          <h2>Reservación</h2>
          <label>Dijite su curp</label>
          <input
            type="text"
            name="curp"
            value={curp}
            onChange={handleChange}
            required
          />
          <button onClick={handleCurpCheck}>Buscar curp</button>
          {results[0].result === "409" ? (
            <>
              <form onSubmit={handleSubmitRes}>
                
                <div>
                  <label>Fecha de Entrada:</label>
                  <DatePicker
                    required
                    selected={startDate}
                    onChange={handleStartDateChange}
                    minDate={today} // No se puede seleccionar una fecha anterior a hoy
                    maxDate={
                      endDate
                        ? new Date(endDate.getTime() - 24 * 60 * 60 * 1000)
                        : null
                    } // No se puede seleccionar un día antes o el mismo día de la fecha de salida
                    filterDate={(date) => !isDateBlocked(date)}
                  />
                </div>
                <div>
                  <label>Fecha de Salida:</label>
                  <DatePicker
                    required
                    selected={endDate}
                    onChange={handleEndDateChange}
                    minDate={
                      startDate
                        ? new Date(startDate.getTime() + 24 * 60 * 60 * 1000)
                        : today
                    } // No se puede seleccionar un día antes o el mismo día de la fecha de inicio
                    filterDate={(date) => !isDateBlocked(date)}
                  />
                </div>
                <div>
                  <label>Noches:</label>
                  <span>{nights}</span>
                </div>
                <div>
                  <label>Precio Total:</label>
                  <span>${price}</span>
                </div>
                <div>
                  <button type="submit">Reservar</button>
                </div>
              </form>
            </>
          ) : results[0].result !== "" ? (
            <>
              <form onSubmit={handleSubmit}>
              <h5>Le pedimos que ingrese algunos datos por favor</h5>
                <label>Nombre:</label>
                <input
                  type="text"
                  name="nombre"
                  value={dataClient.nombre}
                  onChange={handleChange2}
                  required
                />

                <label>Apellido Paterno:</label>
                <input
                  type="text"
                  name="ap1"
                  value={dataClient.ap1}
                  onChange={handleChange2}
                  required
                />
                <label>Apellido materno:</label>
                <input
                  type="text"
                  name="ap2"
                  value={dataClient.ap2}
                  onChange={handleChange2}
                  required
                />
                <label>Telefono:</label>
                <input
                  type="text"
                  name="telefono"
                  value={dataClient.telefono}
                  onChange={handleChange2}
                  required
                />
                <label>Direccion:</label>
                <input
                  type="text"
                  name="direccion"
                  value={dataClient.direccion}
                  onChange={handleChange2}
                  required
                />
                <label>RFC:</label>
                <input
                  type="text"
                  name="rfc"
                  value={dataClient.rfc}
                  onChange={handleChange2}
                  required
                />
                <label>E-mail:</label>
                <input
                  type="text"
                  name="email"
                  value={dataClient.email}
                  onChange={handleChange2}
                  required
                />
                <button type="submit">Registrar</button>
              </form>
            </>
          ) : (
            <></>
          )}
          <button onClick={onclose}>Cancelar</button>
        </div>
      </section>
    </>
  );
}

export default FomrClient;
