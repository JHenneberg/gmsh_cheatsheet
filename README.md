# gmsh_cheatsheet

Short overview of basic commands in gmsh.

# Geometry

## Points

### create point id

```geo
// <NAME> = newp;
P1 = newp;
```

### create point

```geo
// Point(<POINT_ID>) = {<X>, <Y>, <Z>};
Point(P1) = {1.0, 0.0, 0.0};
```

### get coordinates of a point

```geo
// <NAME>[] = Point{<POINT_ID>};
coordinates[] = Point{P1};
```

## Curves

### create new line id

```geo
// <NAME> = newl;
L1 = newl;
```

### create line

```geo
// Line(<LINE_ID>) = {<POINT_1_ID>, <POINT_2_ID>};
Line(L1) = {P1, P2};
```

### create new line loop id

```geo
// <NAME> = newll;
LL1 = newll;
```

### create new line loop

Creating a line loop demands that the are continous and direction can not be neglected.

```geo
// Curve Loop(<LINE_LOOP_ID>) = {<LINE_1_ID>, ..., <LINE_N_ID>};
Curve Loop(LL1) = {L1, L2, L3};
```

### get points of a line

```geo
// <NAME>[] = PointsOf{Line{<LINE_1_ID>, ..., <LINE_N-1_ID>}; Line{<LINE_N_ID>}; };
line_points[] =  PointsOf{
  Line{
    L1,
    L2
  };
  Line{L3};
};
```

## Surfaces

### create new surface id

```geo
// <NAME> = news;
S1 = news;
```

### create new surface

```geo
// Surfaces(<SURFACE_ID> = {<LINE_LOOP_ID>})
Surface(S1) = {LL1};
```

### get points of a surface

```geo
// <NAME>[] = PointsOf{Surface{<SURFACE_1_ID>, ..., <SURFACE_N-1_ID>}; Surface{<SURFACE_N_ID>}; };
surface_points[] = PointsOf{
  Surface{
    S1,
    S2
  };
};
```

## Volumes

### create new volume id

```geo
// <NAME> = newv;
V1 = newv;
```

### create new volume

```geo
// Volume(<VOLUME_ID>) = {<SURFACE_LOOP_ID>};
 Volume(V1) = {SL1};
```

# Mesh

## Structured Mesh

### create structured mesh for a 1D element

```geo
// Transfinite Curve {<CURVE_1_ID>, ... <CURVE_N_ID>} = <NUMBER_OF_NODES> Using Progression <PROGRESSION_FACTOR> []
Transfinite Curve {L1, L2, L3, L4, L5, L6} = 10 Using Progression 1;
```

### create structures mesh for a 2D element

```geo
// Transfinite Surface {<SURFACE_ID>} = [{<POINT_1_ID>, <POINT_2_ID>, <POINT_3_ID> [, <POINT_4_ID>]}]
Transfinite Surface {S1} = {P1, P2, P3};
```