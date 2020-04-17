// Basic Operations in gmsh


// Geometry

// Points

// create point id
// <NAME> = newp;
P1 = newp;

// create point
// Point(<POINT_ID>) = {<X>, <Y>, <Z>};
Point(P1) = {-1.0, +0.0, +0.0};

// get coordinates of a point
// <NAME>[] = Point{<POINT_ID>};
coordinates[] = Point{P1};


// Curves

// create new line id
// <NAME> = newl;
L1 = newl;

// create line
// Line(<LINE_ID>) = {<POINT_1_ID>, <POINT_2_ID>};
P2 = newp; Point(P2) = {+1.0, +0.0, +0.0};

Line(L1) = {P1, P2};

// create new line loop id
// <NAME> = newll;
LL1 = newll;

// create new line loop
// Curve Loop(<LINE_LOOP_ID>) = {<LINE_1_ID>, ..., <LINE_N_ID>};
// Lines have to be continous and direction can not be neglected.
// Have a look at 'create volume'
P3 = newp; Point(P3) = {+0.0, +1.5, +0.0};
L2 = newl; Line(L2) = {P2, P3};
L3 = newl; Line(L3) = {P3, P1};

Curve Loop(LL1) = {L1, L2, L3};

// get points of a line
// <NAME>[] = PointsOf{Line{<LINE_1_ID>, ..., <LINE_N-1_ID>}; Line{<LINE_N_ID>}; };
line_points[] =  PointsOf{
  Line{
    L1,
    L2
  };
  Line{L3};
};


// Surfaces

// create new surface id
// <NAME> = news;
S1 = news;

// create new surface
// Surfaces(<SURFACE_ID> = {<LINE_LOOP_ID>})
Surface(S1) = {LL1};

// create surface loop
P4 = newp; Point(P4) = {0.0, 0.5, 1.0};

L4 = newl; Line(L4) = {P4, P1};
L5 = newl; Line(L5) = {P4, P2};
L6 = newl; Line(L6) = {P4, P3};

LL2 = newll; Curve Loop(LL2) = {+L1, +L4, -L5};
LL3 = newll; Curve Loop(LL3) = {+L2, +L5, -L6};
LL4 = newll; Curve Loop(LL4) = {+L3, -L4, +L6};

S2 = news; Surface(S2) = {LL2};
S3 = news; Surface(S3) = {LL3};
S4 = news; Surface(S4) = {LL4};

SL1 = newsl; Surface Loop(SL1) = {S1, S2, S3, S4};

// get points of a surface
// <NAME>[] = PointsOf{Surface{<SURFACE_1_ID>, ..., <SURFACE_N-1_ID>}; Surface{<SURFACE_N_ID>}; };
surface_points[] = PointsOf{
  Surface{
    S1,
    S2
  };
};

// Volumes

// create new volume id
// <NAME> = newv;
V1 = newv;

// create new volume
// Volume(<VOLUME_ID>) = {<SURFACE_LOOP_ID>};
 Volume(V1) = {SL1};