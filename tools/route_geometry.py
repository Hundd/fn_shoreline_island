"""Independent reference arithmetic for feature 036 safety tests (centimeters)."""
import math

CLOSURE = (7075.0, 7525.0, -13975.0, -13225.0)


def entry(a, b, rect=CLOSURE):
    enter, leave = 0.0, 1.0
    for start, end, low, high in (
        (a[0], b[0], rect[0], rect[1]),
        (a[1], b[1], rect[2], rect[3]),
    ):
        delta = end - start
        if abs(delta) < 1e-6:
            if start < low or start > high:
                return 2.0
        else:
            t1, t2 = (low - start) / delta, (high - start) / delta
            enter, leave = max(enter, min(t1, t2)), min(leave, max(t1, t2))
            if enter > leave:
                return 2.0
    return 2.0 if leave < 0 or enter > 1 else max(0.0, enter)


def safe(a, b, revision):
    low, high = (-14325, -12875) if revision else (-13825, -13375)
    return all(6475 <= p[0] <= 8125 and low <= p[1] <= high for p in (a, b)) and (
        not revision or entry(a, b) > 1
    )


def safe_stop(a, b):
    length = math.dist(a, b)
    fraction = max(0, entry(a, b) - 10 / length) if length else 0
    return tuple(x + (y - x) * fraction for x, y in zip(a, b))
