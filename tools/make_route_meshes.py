"""Author tiny local OBJ primitives for pooled footprint, arrow and X states."""
from pathlib import Path
import math

DEST=Path("specs/036-teach-pix-a-route/evidence/mesh-source")


def write(name, polygons):
    vertices, faces = [], []
    for polygon in polygons:
        base=len(vertices)+1
        vertices.extend((x,y,z) for x,y,z in polygon)
        # Polygon top faces and reverse bottom faces are double sided.
        for i in range(1,len(polygon)-1):
            faces.append((base,base+i,base+i+1))
            faces.append((base+i+1,base+i,base))
    DEST.mkdir(parents=True,exist_ok=True)
    (DEST/f"{name}.obj").write_text("\n".join(
        [f"v {x} {y} {z}" for x,y,z in vertices]+
        ["f "+" ".join(map(str,f)) for f in faces])+"\n")


def ellipse(cx,cy,rx,ry):
    return [(cx+rx*math.cos(i*math.pi/8),cy+ry*math.sin(i*math.pi/8),0) for i in range(16)]


if __name__ == "__main__":
    write("route_footprints",[ellipse(-2,-8,17,5.5),ellipse(2,8,17,5.5)])
    write("route_cursor",[[(-20,-5,0),(4,-5,0),(4,-13,0),(20,0,0),(4,13,0),(4,5,0),(-20,5,0)]])
    polygons=[]
    for angle in (math.pi/4,-math.pi/4):
        polygons.append([(x*math.cos(angle)-y*math.sin(angle),x*math.sin(angle)+y*math.cos(angle),0) for x,y in [(-20,-4),(20,-4),(20,4),(-20,4)]])
    write("route_invalid",polygons)
