from fastapi import FastAPI, HTTPException
from sqlalchemy import create_engine, text
import os

app = FastAPI(title="Humidity Service")

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+psycopg2://postgres:123456@localhost:5432/registros",
)

engine = create_engine(DATABASE_URL)



@app.get("/")
def home():
    return {
        "servicio": "humidity service",
        "estado": "activo"
    }


@app.get("/humidity")
def get_humidity_registers():
    with engine.connect() as conn:
        resultado = conn.execute(
            text("SELECT * FROM humidity ORDER BY timestamp DESC LIMIT 100")
        )
        return [dict(fila) for fila in resultado.mappings()]


@app.get("/humidity/{id}")
def get_humidity(id: int):
    with engine.connect() as conn:
        resultado = conn.execute(
            text("SELECT * FROM humidity WHERE id = :id"),
            {"id": id}
        )
        fila = resultado.mappings().first()
    if fila is None:
        raise HTTPException(status_code=404, detail="Id de registro no encontrado")

    return dict(fila)