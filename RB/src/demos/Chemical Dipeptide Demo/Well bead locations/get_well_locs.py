# %%
import json
import cv2
import numpy as np
import pandas as pd
from IPython.display import display

GREEN = (83, 214, 129)
GREEN_LOWER = tuple(x * 0.8 for x in GREEN)
GREEN_UPPER = tuple(x * 1.2 for x in GREEN)

params = cv2.SimpleBlobDetector_Params()

# Change thresholds
params.minThreshold = 3
params.maxThreshold = 100

# Filter by Area.
params.filterByArea = False
params.minArea = 10

# Filter by Circularity
params.filterByCircularity = False

# Filter by Convexity
params.filterByConvexity = False

# Filter by Inertia
params.filterByInertia = False

IMG = cv2.imread("./initial_locs.png").astype("int64")
pixel_arr = IMG.reshape(-1, 3)
print(max(pixel_arr, key=lambda p: p[1] - (p[0] + p[2]) / 2))
print(IMG.shape)


def get_bead_centers(img_file):
    img = cv2.imread(img_file).astype("int64")

    green_pixels = 255 - cv2.inRange(img, GREEN_LOWER, GREEN_UPPER)

    pd.DataFrame(green_pixels).to_csv("pixels.csv", header=False, index=False)

    detector = cv2.SimpleBlobDetector_create(params)
    keypoints = detector.detect(green_pixels)

    kp_coords = [kp.pt for kp in keypoints]
    pd.DataFrame(kp_coords).to_csv(f"{img_file}.csv")

    return kp_coords


def make_scaler(domain, range):
    x0, x1 = domain
    y0, y1 = range

    def interpolate(x):
        t = (x - x0) / (x1 - x0)
        return y0 * (1 - t) + y1 * t

    return interpolate


def process_pixel_locs(stage):
    filename = f"{stage}_locs.png.csv"
    df: pd.DataFrame = pd.read_csv(filename)
    df.columns = ["i", "x", "y"]

    initial_df = pd.read_csv("initial_locs.png.csv")
    initial_df.columns = ["i", "x", "y"]

    x_domain = (0, IMG.shape[1])
    y_domain = (0, IMG.shape[0])
    if stage == "initial":
        x_scaler = make_scaler(x_domain, (-13, 879))
        y_scaler = make_scaler(y_domain, (-55, 320))

        x_dist_scale = 1
        y_dist_scale = 1

    elif stage == "enzyme":
        x_scaler = make_scaler(x_domain, (44, 836))
        y_scaler = make_scaler(y_domain, (-17, 300))

        x_dist_scale = 1.1
        y_dist_scale = 1

    elif stage == "ligand":
        x_scaler = make_scaler(x_domain, (37, 855))
        y_scaler = make_scaler(y_domain, (-24, 298))

        x_dist_scale = 1.1
        y_dist_scale = 0.9

    df["x"] = df["x"].map(x_scaler)
    df["y"] = df["y"].map(y_scaler)

    mid_x = initial_df["x"].map(x_scaler).mean()

    dist_from_mid_x = (df["x"] - mid_x).abs() * x_dist_scale
    # Kinda misleading; the lowest y (visually) has the largest value, as the top left
    # corner is (0,0)
    dist_from_bottom_y = (df["y"] - df["y"].max()) * y_dist_scale
    df["dist"] = (dist_from_mid_x ** 2 + dist_from_bottom_y ** 2) ** 0.5 * (
        ((df["x"] < mid_x) * 2) - 1
    )
    df = df.sort_values(["dist", "y"], ascending=False)

    return df


def join_pixel_locs(stages):
    pixel_locs = []
    for stage in stages:
        df = process_pixel_locs(stage)
        for i in range(len(df)):
            if i >= len(pixel_locs):
                pixel_locs.append({"i": i})
            idx = df.index[i]
            pixel_locs[i][stage] = df.loc[idx, ["x", "y"]].to_dict()

    with open("out.json", "w") as f:
        json.dump(pixel_locs, f, indent=0)

    with open("../well_beads.js", "w") as f:
        s = "const graphBeadLocs = "
        s += json.dumps(pixel_locs)
        f.write(s)


def main():
    stages = ["initial", "enzyme", "ligand"]
    for stage in stages:
        fn = f"{stage}_locs.png"
        get_bead_centers(fn)

    join_pixel_locs(stages)


if __name__ == "__main__":
    main()

# %%
