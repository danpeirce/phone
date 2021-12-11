
module lithophane()
{
    //  somewhat rough OpenSCAD lithophane - scruss, 2019-10
     infile  = "phone.png";    // input image, PNG greyscale best
     x_px    = 262;  // input image width,  pixels
     y_px    = 255;  // input image height, pixels
     z_min   = 0.8;  // minimum output thickness, mm
     z_max   = 3;    // maximum output thickness, mm
     y_size  = 50;   // output image height, mm
     // don't need to modify anything below here
     translate([0, 0, z_max])scale([y_size / y_px, y_size / y_px, (z_max - z_min)/100])surface(file = infile, invert = true);
     cube([x_px * y_size / y_px, y_size, z_min]);
}


union()
{
    translate([3, 3, 0]) lithophane();
    difference()
    {
        cube([50+6, 50+6, 3]);
        translate([3,3,-0.5]) cube([50, 50, 4]);
    }
}