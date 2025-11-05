// key width functions

module u(u=1) {
  $key_length = u;
  children();
}

module k1u() {
  u(1) children();
}

module k1_25u() {
  u(1.25) children();
}

module k1_5u() {
  u(1.5) children();
}

module k1_75u(){
  u(1.75) children();
}

module k2u() {
  u(2) children();
}

module k2_25u() {
  u(2.25) children();
}

module k2_50u() {
  u(2.5) children();
}

module k2_75u() {
  u(2.75) children();
}

module k6_25u() {
  u(6.25) children();
}

// key height functions

module uh(u=1) {
  $key_height = u;
  children();
}

module k1uh() {
  uh(1) children();
}

module k2uh() {
  uh(2) children();
}

module k1_25uh() {
  uh(1.25) children();
}

module k1_5uh() {
  uh(1.5) children();
}

module k2_25uh() {
  uh(2.25) children();
}

module k2_75uh() {
  uh(2.75) children();
}

module k6_25uh() {
  uh(6.25) children();
}
