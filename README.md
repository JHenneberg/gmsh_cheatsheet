# gmsh_cheatsheet

Short overview of basic commands in gmsh.

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

```geo
// Curve Loop(<LINE_LOOP_ID>) = {<LINE_1_ID>, ..., <LINE_N_ID>};
Curve Loop(LL1) = {L1, L2, L3};
```

### get points of a line

```geo
// <NAME>[] = PointsOf{Line{<LINE_1_ID>, ..., <LINE_N_ID>}};
points[] =  PointsOf{
  Line{L1};
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
