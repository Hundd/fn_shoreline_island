import random
import unittest
from tools.route_geometry import entry, safe, safe_stop


class RouteGeometryTests(unittest.TestCase):
    def test_crossing_and_reversed(self):
        self.assertAlmostEqual(entry((6650,-13600),(7950,-13600)), 425/1300)
        self.assertAlmostEqual(entry((7950,-13600),(6650,-13600)), 425/1300)
        self.assertEqual(safe_stop((6650,-13600),(7950,-13600)), (7065,-13600))

    def test_closed_grazing_and_degenerate(self):
        for y in (-13975,-13225):
            self.assertLessEqual(entry((6650,y),(7950,y)), 1)
        self.assertEqual(entry((7300,-13600),(7300,-13600)), 0)
        self.assertEqual(entry((6650,-13600),(6650,-13600)), 2)
        self.assertLessEqual(entry((7300,-14300),(7300,-12900)), 1)
        self.assertEqual(entry((7074,-14300),(7074,-12900)), 2)

    def test_both_bypasses_and_diagonal_shortcut(self):
        for y in (-14150,-13050):
            path = [(6650,-13600),(6650,y),(7950,y),(7950,-13600)]
            self.assertTrue(all(safe(a,b,True) for a,b in zip(path,path[1:])))
        self.assertFalse(safe((6650,-14150),(7950,-13050),True))

    def test_first_strip_and_floor_limits(self):
        self.assertTrue(safe((6650,-13600),(7950,-13600),False))
        self.assertFalse(safe((6650,-13600),(7950,-13600),True))
        self.assertFalse(safe((6650,-13600),(7950,-14150),False))
        self.assertFalse(safe((6474,-14150),(7950,-14150),True))

    def test_random_segments_against_independent_edge_intersection(self):
        # Independent orientation/edge oracle, rather than a second slab loop.
        rect=(7075,7525,-13975,-13225)
        corners=[(rect[0],rect[2]),(rect[1],rect[2]),(rect[1],rect[3]),(rect[0],rect[3])]
        def cross(a,b,c): return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
        def inside(p): return rect[0]<=p[0]<=rect[1] and rect[2]<=p[1]<=rect[3]
        def intersects(a,b,c,d):
            return cross(a,b,c)*cross(a,b,d)<=0 and cross(c,d,a)*cross(c,d,b)<=0
        rng=random.Random(36)
        for _ in range(2000):
            a=(rng.uniform(6400,8200),rng.uniform(-14400,-12800))
            b=(rng.uniform(6400,8200),rng.uniform(-14400,-12800))
            oracle=inside(a) or inside(b) or any(intersects(a,b,c,d) for c,d in zip(corners,corners[1:]+corners[:1]))
            self.assertEqual(entry(a,b)<=1,oracle)


if __name__ == "__main__":
    unittest.main()
