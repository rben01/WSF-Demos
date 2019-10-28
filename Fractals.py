#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 12:44:25 2019
@author: DannySwift
"""

import IPython.display as IPdisplay
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import io

from PIL import Image
 
iterations=7
start_angle = np.radians(90)
angle = np.radians(45)
angles = [start_angle]
mid_xs = [0]
mid_ys = [0]
lines=[]
            
            
def animate(i):
    bp = 3**i #branchpoints
    xs = mid_xs[-bp:]
    ys = mid_ys[-bp:]
    bpangles = angles[-bp:]
    if i==0:
        lines.append(ax.plot([],[],lw=1, color='g')[0])
        lines[0].set_data([0,0], [0,1])
    for k in range(bp):
        lines.append(ax.plot([],[],lw=1, color='g')[0])
        lines.append(ax.plot([],[],lw=1, color='g')[0])
        x, y = xs[k], ys[k]
        a = bpangles[k]
        a1 = a + angle 
        a2 = a - angle
        newx1, newy1 = x + np.cos(a1) / 2**i, y + np.sin(a1) / 2**i
        newx2, newy2 = x + np.cos(a2) / 2**i, y + np.sin(a2) / 2**i
        lines[-1].set_data([x, newx1], [y, newy1])
        lines[-2].set_data([x, newx2], [y, newy2])
        mid_xs.append(x + (np.cos(a) / 2**i) / 2)
        mid_xs.append((x + newx1) / 2)
        mid_xs.append((x + newx2) / 2)
        mid_ys.append(y + (np.sin(a) / 2**i) / 2)
        mid_ys.append((y + newy1) / 2)
        mid_ys.append((y + newy2) / 2)
        angles.append(a)
        angles.append(a1)
        angles.append(a2)
    
    return lines


if __name__ == '__main__':
    fig, ax = plt.subplots(frameon=False)
    fig.set_facecolor('xkcd:sky')
    ax.set_facecolor('xkcd:sky')
    ax.set_xticks([])
    ax.set_yticks([])
    plt.xlim(-1, 1)
    plt.ylim(-0.7, 1.3)

    images = []
    sio = io.StringIO()
    
    for i in range(iterations):
  
      canvas = plt.get_current_fig_manager().canvas
      canvas.draw()
      pil_image = Image.frombytes('RGB', canvas.get_width_height(), canvas.tostring_rgb())
      images.append(pil_image)

      animate(i)
    

    gif_filepath = 'fractal{}.gif'.format(str(angle))


    images[0].save(
      gif_filepath,
      save_all=True,
      format='GIF',
      append_images=images[1:],
      loop=0,
      duration=1000
    )
    IPdisplay.Image(url=gif_filepath)