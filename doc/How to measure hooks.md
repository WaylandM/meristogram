#How to measure hooks

##Armature of the acanthocephalan proboscis
![SEM of acanthocephalan proboscis with one longitudinal row of hooks highlighted.](/images/long_row_hooks.png)

Hooks are arranged in longitudinal rows. One longitudinal row is highlighted in the image above. To create a meristogram we need measurements from each of the hooks in at least one longitudinal row of hooks per specimen.

##Preparation of material
On removal from the host, acanthocephalans should be washed and relaxed in distilled water, then fixed in 70% ethanol. All acanthocephalans should be prepared for light microscopy using the same protocol. I recommend dehydrating the specimens in an alcohol series and then clearing and mounting in lactophenol.

##Light microscopy
Select a longitudinal row in which all hooks are visible in profile.

![Line drawing of one longitudinal row of hooks in profile](/images/brayi_hooks.png)

##Measurements
From each hook in your selected row record two measurements: length (L) and base (B).

![Hook length and base measurements](/images/hook_measurements.png)


##Storing hook measurement data
The input file format for the meristogram is comma separated value (CSV) with four columns: specimen, hook, length and base.

* **specimen** - unique identifier for the specimen
* **hook** - numerical position of hook in longitudinal row as counted from the distal end of the proboscis
* **length** - length of hook blade
* **base** - width of hook base

Data can be entered into your favourite spreadsheet program and saved as a comma separated value (CSV) file:

![Spreadsheet of raw data.](/images/spreadsheet_raw_data.png)

Example hook data files can be found in:
https://github.com/WaylandM/meristogram/tree/master/data



