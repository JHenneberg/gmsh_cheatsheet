# gmsh_cheatsheet

Short overview of basic commands in gmsh.
The official manual you can find [here](http://gmsh.info/doc/texinfo/gmsh.html)

# Geometry

## Points

### create point id

```gmsh
// <IDENTIFIER> = newp;
P1 = newp;
```

### create point

```gmsh
// Point(<POINT_ID>) = {<X>, <Y>, <Z>};
Point(P1) = {1.0, 0.0, 0.0};
```

### get coordinates of a point

```gmsh
// <IDENTIFIER>[] = Point{<POINT_ID>};
coordinates[] = Point{P1};
```

## Curves

### create new line id

```gmsh
// <IDENTIFIER> = newl;
L1 = newl;
```

### create line

```gmsh
// Line(<LINE_ID>) = {<POINT_1_ID>, <POINT_2_ID>};
Line(L1) = {P1, P2};
```

### create new line loop id

```gmsh
// <IDENTIFIER> = newll;
LL1 = newll;
```

### create new line loop

Creating a line loop demands that the are continous and direction can not be neglected.

```gmsh
// Curve Loop(<LINE_LOOP_ID>) = {<LINE_1_ID>, ..., <LINE_N_ID>};
Curve Loop(LL1) = {L1, L2, L3};
```

### get points of a line

```gmsh
// <IDENTIFIER>[] = PointsOf{Line{<LINE_1_ID>, ..., <LINE_N-1_ID>}; Line{<LINE_N_ID>}; };
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

```gmsh
// <IDENTIFIER> = news;
S1 = news;
```

### create new surface

```gmsh
// Surfaces(<SURFACE_ID> = {<LINE_LOOP_ID>})
Surface(S1) = {LL1};
```

### get points of a surface

```gmsh
// <IDENTIFIER>[] = PointsOf{Surface{<SURFACE_1_ID>, ..., <SURFACE_N-1_ID>}; Surface{<SURFACE_N_ID>}; };
surface_points[] = PointsOf{
  Surface{
    S1,
    S2
  };
};
```

## Volumes

### create new volume id

```gmsh
// <IDENTIFIER> = newv;
V1 = newv;
```

### create new volume

```gmsh
// Volume(<VOLUME_ID>) = {<SURFACE_LOOP_ID>};
 Volume(V1) = {SL1};
```

# Miscellaneous

## Print to terminal

### print text to terminal

```gmsh
  // Printf("<TEXT>");
  Printf("Hello Wourld!");
```

### print variable to terminal

```gmsh
  // Printf("<FORMATTING_CHARACTER>", <>);
  Printf("%g", V1);
```

## Lists

### define a list

```gmsh
// <IDENTIFIER>[] = {<ITEM_1>, ..., <ITEM_N>};
  list[] = {4, 6, 8, 10, 12, 14};
```

### access a single item from a list

```gmsh
  // <IDENTIFIER>[<ITEM_ID>];
  list[0];
```

### access a sequence of items from a list

```gmsh
  // <IDENTIFIER>[{<ITEM_1>:<ITEM_N>:<SEQUENCE_STEP>}];
  list1[] = list[{0:5}]; // 4, 6, 8, 10, 12, 14
  list2[] = list[{0:5:2}]; // 4, 8, 12
```

### access all items form a list

```gmsh
  // <IDENTIFIER>[] = <IDENTIFIER>[];
  list3[] = list[];
```

### get the size of a list

```gmsh
  // <SIZE_LIST> = #<LIST>[];
  size_list = #list[];
```

# Mesh

## Structured Mesh

### create structured mesh for a 1D element

```gmsh
// Transfinite Curve {<CURVE_1_ID>, ... <CURVE_N_ID>} = <NUMBER_OF_NODES> Using Progression <PROGRESSION_FACTOR> []
Transfinite Curve {L1, L2, L3, L4, L5, L6} = 10 Using Progression 1;
```

### create structures mesh for a 2D element

```gmsh
// Transfinite Surface {<SURFACE_ID>} = [{<POINT_1_ID>, <POINT_2_ID>, <POINT_3_ID> [, <POINT_4_ID>]}]
Transfinite Surface {S1} = {P1, P2, P3};
```