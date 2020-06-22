# %%
import json
from pathlib import Path

import numpy as np
from IPython.display import display  # noqa F401
from scipy.spatial import Delaunay


# An arrow pointing in the +x dir
def get_arrow_trisurf():
    HEIGHT = 0.2
    DISTANCE = 0
    RADIUS = 0.05
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


data = {
    "arrowhead": get_arrow_trisurf(),
}

data_str = json.dumps(data, indent=0)
js_str = f"const ARROWHEAD_POINTS = {data_str}"
save_dir = Path(__file__).resolve().parent
with open(save_dir / "arrowhead.js", "w") as f:
    f.write(js_str)
