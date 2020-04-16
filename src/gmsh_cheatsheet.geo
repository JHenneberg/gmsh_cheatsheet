// Basic Operations in gmsh

// Points

// create point id
// <NAME> = newp;
P1 = newp;

// create point
// Point(<POINT_ID>) = {<X>, <Y>, <Z>};
Point(P1) = {1.0, 0.0, 0.0};

// get coordinates of a point
// <NAME>[] = Point{<POINT_ID>};
coordinates[] = Point{P1};


// Curves

// create new line id
// <NAME> = newl;
L1 = newl;

// create line
// Line(<LINE_ID>) = {<POINT_1_ID>, <POINT_2_ID>};
P2 = newp; Point(P2) = {2.0, 0.0, 0.0};

Line(L1) = {P1, P2};

// create new line loop id
// <NAME> = newll;
LL1 = newll;

// create new line loop
// Curve Loop(<LINE_LOOP_ID>) = {<LINE_1_ID>, ..., <LINE_N_ID>};
P3 = newp; Point(P3) = {1.5, 1.0, 0.0};
L2 = newl; Line(L2) = {P2, P3};
L3 = newl; Line(L3) = {P3, P1};

Curve Loop(LL1) = {L1, L2, L3};

// get points of a line
// <NAME>[] = PointsOf{Line{<LINE_1_ID>, ..., <LINE_N_ID>}};
points[] =  PointsOf{
  Line{L1};
  Line{L3};
};


// Surfaces

// create new surface id
// <NAME> = news;
S1 = news;

// create new surface
// Surfaces(<SURFACE_ID> = {<LINE_LOOP_ID>})
Surface(S1) = {LL1};