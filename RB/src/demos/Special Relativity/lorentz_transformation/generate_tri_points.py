# %%
import json
from pathlib import Path

import numpy as np
from IPython.display import display  # noqa F401
from scipy.spatial import Delaunay

MAJOR_RADIUS = 3
MINOR_RADIUS = 0.2

n = 50
u = np.linspace(0, 2 * np.pi, n)
v = np.linspace(0, 2 * np.pi, n)
u, v = np.meshgrid(u, v)
u = u.flatten()
v = v.flatten()

x = (MAJOR_RADIUS + MINOR_RADIUS * (np.cos(v))) * np.cos(u)
y = (MAJOR_RADIUS + MINOR_RADIUS * (np.cos(v))) * np.sin(u)
z = MINOR_RADIUS * np.sin(v)

points2D = np.vstack([u, v]).T
tri = Delaunay(points2D)
simplices = tri.simplices

data = {
    "x": x.tolist(),
    "y": y.tolist(),
    "z": z.tolist(),
    "simplices": simplices.tolist(),
}
data_str = json.dumps(data, indent=0)
js_str = f"const TORUS_POINTS = {data_str}"
save_dir = Path(__file__).resolve().parent
with open(save_dir / "torus.js", "w") as f:
    f.write(js_str)
