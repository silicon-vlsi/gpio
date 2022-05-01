# KnowledgeBase

### Using `.ALTER` instead of `.STEP LIB` when too much memory is required

You can step through library variations using the `.STEP LIB` command where Eldo will make a run for each variant of the libraries.

When you use the `.STEP LIB` command all simulation information for all variants are stored in memory. This could lead to an unexpected amount of memory usage if you are using many parameters and models.

To prevent excessive memory usage,  you can use the `.ALTER` command as an alternative to step through the library variations.  Using `.ALTERs` will store in memory only the simulation information needed for one variant at a time and you could see 10-15x less memory usage.

Here is an example of using `.ALTER` to replace `.STEP LIB`:

Replace:

```
.STEP LIB(mylib.eldo)) LIST (ss tt ff)
```

with:

```
...
.ALTER ss
.LIB mylib.eldo ss
.ALTER tt
.LIB mylib.eldo tt
.ALTER ff
.LIB mylib.eldo ff
```

You can find more information regarding `.ALTER` in the Eldo Platform Reference Manual 17.1 and the `.STEP LIB` in the Eldo Platform User's Manual 17.1.


### Post-processing with TCL on the same waveform from different .wdb files using EZwave

AMS2009.2

Suppose we have a waveform called `_OUTPUT_FREQUENCY_` that is present in different `.wdb` files such as `CARAC_Corner_1.wdb`, `CARAC_Corner_2.wdb`, etc.

Here is the corresponding TCL script (`calc.tcl`):

```tcl
# variable fileRootName stands for the .wdb's rootname
set fileRootName "CARAC_Corner_"

# variable EXT stands for EZwave's EXT folder
set folder EXT

# variable netName stands for the net to plot
set netName "_OUTPUT FREQUENCY_"

# count the total number of .wdb to open
set N [regexp -all wdb [glob -nocomplain $fileRootName*]]

# create and open in batch the results.txt file that contains min/max of $netName
set min_max [open "results.txt" w]

for {set j 1}  {$j <= $N} {incr j} {
    # open .wdb
    set mydb [dataset open ${fileRootName}${j}.wdb]

    # plot net
    add wave -label "${netName}${j}" -row 1 -rowtitle "$netName" "<$mydb/$folder>$netName"

    # calculate drv and plot drv
    set kvco [wfc drv(wf("<$mydb/$folder>$netName"))]
    add wave -label "KVCO_$j" -row 2 -rowtitle "KVCO" $kvco

    # write the min/max in results.txt (scientific format with 6 decimals)
    puts $min_max "${mydb}: MAX($netName)=[format %.6e [wfc max(wf("<$mydb/$folder>$netName"))]]"
    puts $min_max "${mydb}: MIN($netName)=[format %.6e [wfc min(wf("<$mydb/$folder>$netName"))]]"
}

# close the results.txt file
close $min_max
```

Invoke the script with EZwave by using:
`ezwave -do calc.tcl`


### Tcl script to plot the same net from many different .wdb files

Suppose you have a waveform called `NET1` in hundred of files called `simple1.wdb, simple2.wdb, ... simple100.wdb`. You could write a simple script like the following to display all the waveforms in the same row using EZwave:

```tcl
set fileRootName "simple"
set nbFiles 100
set netName NET1

for {set j 1}  {$j <= $nbFiles} {incr j} {

    # ===== Open required Database =====
    dataset open ${FILEROOTNAME}${J}.wdb ${FILEROOTNAME}${J}

    # ===== Open the window =====


    # ===== Create row #1 =====
    add wave -append $netName

    # ====== Create the cursors, markers and measurements =====

}
```

If you call this script `same_net_all_wdb.tcl`, just start EZwave with the following command line:

```tcl
ezwave -do same_net_all_wdb.tcl
```
