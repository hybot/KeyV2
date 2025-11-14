// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

// custom settings for the key style i like (SA), with customizer options for most.

include <./includes.scad>

/* [Stem] */
$support_type = "flat"; // [flat, flared, bars, disabled]

$stem_type = "rounded_cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

$stem_support_type = "disabled"; // [tines, brim, disabled]

/* [ Legend ] */
// number of lines.  "0" for a blank key
num_lines = 2; // [0, 1, 2, 3]

// text for line 1
legend1 = "FUCK";

// text for line 2
legend2 = "IT";

// text for line 3
legend3 = "";

text_size1 = 3.0; // .1
text_size2 = 3.0; // .1
text_size3 = 3.0; // .1

position1 = [0, -.4];
position2 = [0, .5];
position3 = [0, 1];

// the line positioning is adjusted base on the number of lines chosen
// one is centered, two centered above and below the center line,
// three have the middle line centered and first and last above and below that.
//
// this assumes a font size close to 3.0.  unfortunately customizer can't deal
// with arrays with dimensions greater than 2
positions = [[[0, 0]], // blank cap
             [[0, 0]], // one line
             [[0, -.4], [0, .5]],  // two lines
             [[0, -.9], [0, 0], [0, .9]] // three lines
             ];

// you don't have to use mono spaced, but it looks nicer for multi-line keycaps
$font="DejaVu Sans Mono:style=bold";

// how deep to engrave the legends.  the libray default of .2 is too shallow for filling
$inset_legend_depth = 0.4;

/* [Misc] */
// hole for an LED below the cap to shine through.
LED_hole=false;

// mostly for resin printing, not FDM, but more than 360 will bump render time quite a bit.
$fn=360;

// my custom key, with a 1 or 2 or 3 line legend, mostly flat, with an optional LED hole
difference() {
  sa_row(3) {
    $total_depth = 9; // a short key, since it's for a keychain
    $height_slices = 40; // smoothing for resin printers
    $dish_depth=.001; // you want very flat (but not 0) or rounded, to avoid artifacts.

    if(num_lines == 0)
      key();
    if(num_lines == 1)
      legend(legend1, position=positions[1][0], size=text_size1)
        key();
    if(num_lines == 2)
      legend(legend1, position=positions[2][0], size=text_size1)
        legend(legend2, position=positions[2][1], size=text_size2)
        key();
    if(num_lines == 3)
      legend(legend1, position=positions[3][0], size=text_size1)
        legend(legend2, position=positions[3][1], size=text_size2)
        legend(legend3, position=positions[3][2], size=text_size3)
        key();
  }
  if(LED_hole) {
    translate([0, 4.25, 0]) 
      cylinder(h=10, r=1.1);
  }
}
