from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI(title="API Gateway")

HUMIDITY_SERVICE = "http://humidity:8000"
PRESSURE_SERVICE = "http://pressure:8000"
SENSORS_SERVICE = "http://sensors:8000"
TEMPERATURE_SERVICE = "http://temperature:8000"


async def pedir(url: str):
    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url)
        except httpx.RequestError:
            raise HTTPException(status_code=502, detail="Servicio no disponible")
    if response.status_code != 200:
        raise HTTPException(status_code=response.status_code, detail=response.json())
    return response.json()


@app.get("/")
def home():
    return {
        "servicio": "API Gateway",
        "estado": "activo"
    }


@app.get("/api/humidity")
async def get_humidity():
    return await pedir(f"{HUMIDITY_SERVICE}/humidity")


@app.get("/api/pressure")
async def get_pressure():
    return await pedir(f"{PRESSURE_SERVICE}/pressure")


@app.get("/api/sensors")
async def get_sensors():
    return await pedir(f"{SENSORS_SERVICE}/sensors")


@app.get("/api/temperature")
async def get_temperature():
    return await pedir(f"{TEMPERATURE_SERVICE}/temperature")


@app.get("/api/humidity/{id}")
async def get_humidity_by_id(id: int):
    return await pedir(f"{HUMIDITY_SERVICE}/humidity/{id}")


@app.get("/api/pressure/{id}")
async def get_pressure_by_id(id: int):
    return await pedir(f"{PRESSURE_SERVICE}/pressure/{id}")


@app.get("/api/sensors/{id}")
async def get_sensors_by_id(id: int):
    return await pedir(f"{SENSORS_SERVICE}/sensors/{id}")


@app.get("/api/temperature/{id}")
async def get_temperature_by_id(id: int):
    return await pedir(f"{TEMPERATURE_SERVICE}/temperature/{id}")