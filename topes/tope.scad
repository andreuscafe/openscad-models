include <../lib/roundedcube.scad>;
$fn = $preview ? 32 : 64;

tube_radius = 23 / 2 + 0.2; // 0.2 for tolerance
walls_thickness = 5;
walls_height = 30;

screw_head_diameter = 9;
screw_body_diameter = 5;



difference() {
  translate([0, -15, 15]) {
    roundedcube([
      tube_radius * 2 + 10,
      tube_radius * 2 + 15,
      30
    ], true, 8, "z");
  }
  
  translate([0, -tube_radius / 2, (walls_height / 2)]) {
    cylinder(r=tube_radius, h=walls_height + 0.1, center=true);

    translate([0, tube_radius, 0]) {
      cube([
        tube_radius * 2,
        tube_radius * 2,
        walls_height + 0.1
      ], center = true);
    }
  }


  #translate([0, -tube_radius * 2.2, walls_height / 2]) {
    cylinder(r=screw_body_diameter/2, h=walls_height + 0.1, center=true);
    
    translate([0, 0, 15]) {
      cylinder(r=screw_head_diameter/2, h=walls_height + 0.1, center=true);
    }
  }
}

