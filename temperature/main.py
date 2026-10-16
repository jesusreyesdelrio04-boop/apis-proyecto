from fastapi import FastAPI, HTTPException
from sqlalchemy import create_engine, text
import os

app = FastAPI(title="Temperature Service")

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+psycopg2://postgres:123456@localhost:5432/registros",
)

engine = create_engine(DATABASE_URL)



@app.get("/")
def home():
    return {
        "servicio": "temperature service",
        "estado": "activo"
    }


@app.get("/temperature")
def get_temperature_registers():
    with engine.connect() as conn:
        resultado = conn.execute(
            text("SELECT * FROM temperature ORDER BY timestamp DESC LIMIT 100")
        )
        return [dict(fila) for fila in resultado.mappings()]


@app.get("/temperature/{id}")
def get_temperature(id: int):
    with engine.connect() as conn:
        resultado = conn.execute(
            text("SELECT * FROM temperature WHERE id = :id"),
            {"id": id}
        )
        fila = resultado.mappings().first()
    if fila is None:
        raise HTTPException(status_code=404, detail="Id de registro no encontrado")

    return dict(fila)