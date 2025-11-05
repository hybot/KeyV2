include <functions.scad>
use <key_sizes.scad>
use <key_transformations.scad>

module spacebar() {
  $inverted_dish = $dish_type != "disable";
  $dish_type = $dish_type != "disable" ? "sideways cylindrical" : "disable";
  k6_25u() stabilized(mm=50) children();
}

module lshift() {
  k2_25u() stabilized() children();
}

module rshift() {
  k2_75u() stabilized() children();
}

module backspace() {
  k2u() stabilized() children();
}

module enter() {
  k2_25u() stabilized() children();
}

module numpad_enter() {
  k2uh() stabilized(vertical=true) children();
}

module numpad_plus() {
  numpad_enter() children();
}

module numpad_0() {
  backspace() children();
}

module stepped_caps_lock() {
  u(1.75) {
    $stem_positions = [[-5, 0]];
    children();
  }
}

module iso_enter() {
  $key_length = 1.5;
  $key_height = 2;

  $dish_offset_x = -(unit_length(1.5) - unit_length(1.25))/2;

  /* $top_tilt = 0; */
  $stem_support_type = "disable";
  $key_shape_type = "iso_enter";
  $hull_shape_type = "skin";
  $linear_extrude_height_adjustment = 19.05 * 0.5;
  // this equals (unit_length(1.5) - unit_length(1.25)) / 2
  /* $dish_overdraw_width = 2.38125; */

  render() {
    stabilized(vertical=true) {
      children();
    }
  }
}
