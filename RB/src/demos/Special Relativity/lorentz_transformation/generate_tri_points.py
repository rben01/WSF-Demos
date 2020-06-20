# %%
import json
from pathlib import Path

import numpy as np
from IPython.display import display  # noqa F401
from scipy.spatial import Delaunay


# https://plotly.com/python/trisurf/#torus
n = 50
theta1d = np.linspace(0, 2 * np.pi, n)
phi1d = np.linspace(0, 2 * np.pi, n)
theta2d, phi2d = np.meshgrid(theta1d, phi1d)
theta1d = theta2d.flatten()
phi1d = phi2d.flatten()


def get_torus_xyz(theta, phi):
    MAJOR_RADIUS = 3
    MINOR_RADIUS = 1.5
    x = (MAJOR_RADIUS + MINOR_RADIUS * np.cos(phi)) * np.cos(theta)
    y = (MAJOR_RADIUS + MINOR_RADIUS * np.cos(phi)) * np.sin(theta)
    z = MINOR_RADIUS * np.sin(phi)
    return x, y, z


# An arrow pointing in the +x dir
def get_arrow_trisurf():
    HEIGHT = 1
    DISTANCE = 7.9 - HEIGHT
    RADIUS = 0.38
    theta = np.linspace(0, 2 * np.pi, 30)

    x = DISTANCE * np.ones_like(theta)
    y = RADIUS * np.cos(theta)
    z = RADIUS * np.sin(theta)

    x = [*x, HEIGHT + DISTANCE]
    z = [*z, 0]
    y = [*y, 0]

    phi = [*np.zeros_like(theta), 1]
    theta = [*theta, 0]

    tri = Delaunay(np.vstack([theta, phi]).T)

    return {"x": x, "y": y, "z": z, "simplices": tri.simplices.tolist()}


x1d, y1d, z1d = get_torus_xyz(theta1d, phi1d)

points2D = np.vstack([theta1d, phi1d]).T
tri = Delaunay(points2D)
simplices = tri.simplices

data = {
    "x": x1d.tolist(),
    "y": y1d.tolist(),
    "z": z1d.tolist(),
    "simplices": simplices.tolist(),
    "arrowhead": get_arrow_trisurf(),
}

data_str = json.dumps(data, indent=0)
js_str = f"const TORUS_POINTS = {data_str}"
save_dir = Path(__file__).resolve().parent
with open(save_dir / "torus.js", "w") as f:
    f.write(js_str)
