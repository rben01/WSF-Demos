# %%
import json
from pathlib import Path

import numpy as np
from IPython.display import display  # noqa F401
from scipy.spatial import Delaunay

XMIN = YMIN = -10
XMAX = YMAX = 10
N_POINTS = 51


def f(x, y):
    return -3 * (x + y)


def get_zs(xs, ys, x_major):
    zs = []
    for x in xs[::5]:
        sinXOverX = 1 if x == 0 else np.sin(x) / x
        row = []
        for y in ys:
            sinYOverY = 1 if y == 0 else np.sin(y) / y
            z = f(sinXOverX, sinYOverY)
            if x_major:
                row.append((x, y, z))
            else:
                row.append((y, x, z))
        zs.append(row)
    return zs


# An arrow pointing in the +x dir
def get_well_trisurf():
    x_gridlines = np.linspace(XMIN, XMAX, N_POINTS)
    y_gridlines = np.linspace(YMIN, YMAX, N_POINTS)
    gridlines = [
        *get_zs(x_gridlines, y_gridlines, True),
        *get_zs(x_gridlines, y_gridlines, False),
    ]

    x_vals = np.linspace(XMIN, XMAX, N_POINTS)
    y_vals = np.linspace(YMIN, YMAX, N_POINTS)

    x, y = np.meshgrid(x_vals, y_vals)
    x_flat = x.ravel()
    y_flat = y.ravel()

    sinXOverX = np.divide(np.sin(x), x, where=x != 0)
    sinXOverX[x == 0] = 1
    sinYOverY = np.divide(np.sin(y), y, where=y != 0)
    sinYOverY[y == 0] = 1

    z = f(sinXOverX, sinYOverY)
    z_flat = z.ravel()

    tri = Delaunay(np.vstack([x_flat, y_flat]).T)

    return {
        "x": x_flat.tolist(),
        "y": y_flat.tolist(),
        "z": z_flat.tolist(),
        "simplices": tri.simplices.tolist(),
        "gridlines": gridlines,
    }


def get_peptide_sphere_surface(radius):
    theta_vals = np.linspace(0, 2 * np.pi, 21)
    phi_vals = np.linspace(-np.pi / 2, np.pi / 2, 21)

    theta, phi = np.meshgrid(theta_vals, phi_vals)
    theta_flat = theta.ravel()
    phi_flat = phi.ravel()

    x = radius * np.cos(theta_flat) * np.cos(phi_flat)
    y = radius * np.sin(theta_flat) * np.cos(phi_flat)
    z = radius * np.sin(phi_flat)

    tri = Delaunay(np.vstack([theta_flat, phi_flat]).T)

    return {
        "x": x.tolist(),
        "y": y.tolist(),
        "z": z.tolist(),
        "simplices": tri.simplices.tolist(),
    }


data = {"well": get_well_trisurf(), "peptide": get_peptide_sphere_surface(0.5)}

if __name__ == "__main__":
    data_str = json.dumps(data, indent=0)
    js_str = f"const DIPEPTIDE_WELL = {data_str};"
    save_dir = Path(__file__).resolve().parent
    with open(save_dir / "dipeptide_well.js", "w") as fi:
        fi.write(js_str)
