/* eslint-disable no-use-before-define */
// Contents of this file copied more or less wholesale from https://stackoverflow.com/a/10045537

// Return the area for a list of points [x,y]
// Self-crossing polys reduce the effective 'area'
function shoelaceTheorem(points) {
	const p1 = points[0];
	const p2 = points[points.length - 1];
	if (!(p1[0] === p2[0] && p1[1] === p2[1])) {
		points = [...points, p1];
	}

	let area = 0;
	const len = points.length;
	for (let i = 0; i < len; ++i) {
		const p1 = points[i];
		const p2 = points[(i + -1 + len) % len];
		area += (p2[0] + p1[0]) * (p2[1] - p1[1]);
	}
	return Math.abs(area / 2);
}

// path:      an SVG <path> element
// threshold: a 'close-enough' limit (ignore subdivisions with area less than this)
// segments:  (optional) how many segments to subdivisions to create at each level
// returns:   a new SVG <polygon> element
// eslint-disable-next-line no-unused-vars
function areaInsidePath(path, threshold, segments, { xScale, yScale } = {}) {
	if (!threshold) {
		threshold = 0.0001;
	} // Get really, really close
	if (!segments) {
		segments = 3;
	} // 2 segments creates 0-area triangles

	const points = subdivide(ptWithLength(0), ptWithLength(path.getTotalLength()));
	for (let i = points.length; i--; ) {
		const _x = points[i].x;
		const _y = points[i].y;
		const x = xScale !== undefined ? xScale.invert(_x) : _x;
		const y = yScale !== undefined ? yScale.invert(_y) : _y;
		points[i] = [x, y];
	}

	return shoelaceTheorem(points);

	// Record the distance along the path with the point for later reference
	function ptWithLength(d) {
		const pt = path.getPointAtLength(d);
		pt.d = d;
		return pt;
	}

	// Create segments evenly spaced between two points on the path.
	// If the area of the result is less than the threshold return the endpoints.
	// Otherwise, keep the intermediary points and subdivide each consecutive pair.
	function subdivide(p1, p2) {
		const pts = [p1];
		for (let i = 1, step = (p2.d - p1.d) / segments; i < segments; i++) {
			pts[i] = ptWithLength(p1.d + step * i);
		}
		pts.push(p2);
		if (polyArea(pts) <= threshold) {
			return [p1, p2];
		} else {
			let result = [];
			for (let i = 1; i < pts.length; ++i) {
				const mids = subdivide(pts[i - 1], pts[i]);
				mids.pop(); // We'll get the last point as the start of the next pair
				result = result.concat(mids);
			}
			result.push(p2);
			return result;
		}
	}

	// Calculate the area of an polygon represented by an array of points
	function polyArea(points) {
		let p1, p2;
		let area = 0;
		for (let len = points.length, i = 0; i < len; ++i) {
			p1 = points[i];
			p2 = points[(i - 1 + len) % len]; // Previous point, with wraparound
			area += (p2.x + p1.x) * (p2.y - p1.y);
		}
		return Math.abs(area / 2);
	}
}
