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


def get_xyz(theta, phi):
    MAJOR_RADIUS = 3
    MINOR_RADIUS = 1
    x = (MAJOR_RADIUS + MINOR_RADIUS * np.cos(phi)) * np.cos(theta)
    y = (MAJOR_RADIUS + MINOR_RADIUS * np.cos(phi)) * np.sin(theta)
    z = MINOR_RADIUS * np.sin(phi)
    return x, y, z


x1d, y1d, z1d = get_xyz(theta1d, phi1d)
x2d, y2d, z2d = get_xyz(theta2d, phi2d)

# rings = []
# points = np.array([x2d, y2d, z2d])
# for i in range(points.shape[1]):
#     rings.append(points[:, i, :].T.tolist())
# for i in range(points.shape[2]):
#     rings.append(points[:, :, 2].T.tolist())


points2D = np.vstack([theta1d, phi1d]).T
tri = Delaunay(points2D)
simplices = tri.simplices

data = {
    "x": x1d.tolist(),
    "y": y1d.tolist(),
    "z": z1d.tolist(),
    "simplices": simplices.tolist(),
    # "rings": rings,
}

data_str = json.dumps(data, indent=0)
js_str = f"const TORUS_POINTS = {data_str}"
save_dir = Path(__file__).resolve().parent
with open(save_dir / "torus.js", "w") as f:
    f.write(js_str)
