# %%
import json
from pathlib import Path

import numpy as np
from IPython.display import display  # noqa F401
from scipy.spatial import Delaunay
from scipy import signal

XMAX = 5 * np.pi
XMIN = -XMAX

YMAX = 4 * np.pi
YMIN = -YMAX

N_POINTS = 51


DEPTH_GRID = np.array(
    [[5, 2, 1, 2, 1], [6, 3, 1, 3, 2], [3, 4, 1, 2, 3], [1, 2, 1, 3, 5]]
)[::-1]


def hump(magnitude, n_x, n_y):
    hump_x = signal.cosine(n_y, True)
    hump_y = signal.cosine(n_x, True)
    x, y = np.meshgrid(hump_x, hump_y)
    return x * y * (magnitude - 1) + 1


def f(x, y):
    return 0.5 * (-np.cos(x) + np.cos(y))


def get_gridlines2(xs, ys, *, x_major, n_gridlines):
    if not x_major:
        xs, ys = ys, xs

    gridlines = []
    keep_indices = np.linspace(0, len(xs) - 1, n_gridlines, dtype=int)
    for x in xs[keep_indices]:
        row = []
        for y in ys:
            if x_major:
                z = f(x, y)
                row.append((x, y, z))
            else:
                z = f(y, x)
                row.append((y, x, z))
        gridlines.append(row)
    return gridlines


def get_gridlines(z, n_x_gridlines, n_y_gridlines):

    print(gridlines)
    return gridlines


def get_well_trisurf():
    x_vals = np.linspace(XMIN, XMAX, N_POINTS)
    y_vals = np.linspace(YMIN, YMAX, N_POINTS)
    gridlines = [
        # *get_gridlines(
        #     x_vals, y_vals, x_major=True, n_gridlines=
        # ),
        # *get_gridlines(
        #     x_vals, y_vals, x_major=False, n_gridlines=,
        # ),
    ]

    x, y = np.meshgrid(x_vals, y_vals)

    z = f(x, y)

    n_i_wells = DEPTH_GRID.shape[0]
    n_j_wells = DEPTH_GRID.shape[1]

    for i in range(n_i_wells):
        i_length = z.shape[0] // n_i_wells
        i_indexer = slice(
            i * i_length, (i + 1) * i_length if i != n_i_wells - 1 else None
        )

        for j in range(n_j_wells):
            j_length = z.shape[1] // n_j_wells
            j_indexer = slice(
                j * j_length, (j + 1) * j_length if j != n_j_wells - 1 else None
            )

            arr = z
            section_to_humpify = arr[i_indexer, j_indexer]

            arr[i_indexer, j_indexer] *= hump(
                DEPTH_GRID[i, j],
                section_to_humpify.shape[0],
                section_to_humpify.shape[1],
            )

    x_flat = x.ravel()
    y_flat = y.ravel()
    z_flat = z.ravel()

    tri = Delaunay(np.vstack([x_flat, y_flat]).T)

    n_x_gridlines = 1 + round((YMAX - YMIN) / np.pi)
    n_y_gridlines = 1 + round((XMAX - XMIN) / np.pi)

    x_indices = np.linspace(0, z.shape[0] - 1, n_x_gridlines, dtype=int)
    y_indices = np.linspace(0, z.shape[1] - 1, n_y_gridlines, dtype=int)

    xyz = np.array([x, y, z])
    x_gridlines = xyz[:, x_indices, :].transpose([1, 2, 0]).tolist()
    y_gridlines = xyz[:, :, y_indices].transpose([2, 1, 0]).tolist()
    gridlines = [*x_gridlines, *y_gridlines]
    # gridlines = np.concatenate([xyz[:, x_indices, :], xyz[:, :, y_indices]])

    # for i in x_indices:
    #     row = []
    #     for j in y_indices:
    #         row.append((x[i, j], y[j, j], z[i, j]))
    #     gridlines.append(row)

    # for j in y_indices:
    #     row = []
    #     for i in x_indices:
    #         row.append((x[i, j], y[i, j], z[i, j]))
    #     gridlines.append(row)

    # print(gridlines)

    return {
        "x": x_flat.tolist(),
        "y": y_flat.tolist(),
        "z": z_flat.tolist(),
        "simplices": tri.simplices.tolist(),
        "gridlines": gridlines,
        "grid": z.tolist(),
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
