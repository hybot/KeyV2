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
legend1 = "FUCK";
legend2 = "IT";

text_size1 = 3.0; // .1
text_size2 = 3.0; // .1

position1 = [0, -.4];
position2 = [0, .5];

$font="DejaVu Sans Mono:style=bold";
$inset_legend_depth = 0.4;

/* [Misc] */
// hole for the LED to shine through on the Central Computers keychain key.
LED_hole=false;

// we're resin printing, not FDM, but more than 360 will bump render time quite a bit.
$fn=360;

// my custom key, with a 2 line legend, and mostly flat. with optional LED hole
difference() {
  sa_row(3) {
    $total_depth = 9;
    $height_slices = 40;
    $dish_depth=.001;
    legend(legend1, position=position1, size=text_size1)
      legend(legend2, position=position2, size=text_size2)
    key();
  }
  if(LED_hole) {
    translate([0, 4.25, 0]) 
      cylinder(h=10, r=1.1);
  }
}
