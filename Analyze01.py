# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
import pandas as pd


# %%
import matplotlib.pyplot as plt


# %%
import os


# %%
air_quality = pd.read_csv("data/air_quality_no2.csv",index_col=0, parse_dates=True)


# %%
air_quality.head()


# %%
air_quality.plot()


# %%
air_quality["station_paris"].plot()


# %%
air_quality.plot.scatter(x="station_london",y="station_paris",alpha=0.5)


# %%
[method_name for method_name in dir(air_quality.plot) if not method_name.startswith("_")]


# %%
[method for method in dir(air_quality.plot) if not method.startswith("_")]


# %%
air_quality.plot.box()


# %%
axs = air_quality.plot.area(figsize=(12, 4), subplots=True)


# %%
fig, axs = plt.subplots()
air_quality.plot.area(ax=axs)


# %%


