/* global THREE applyGraphicalObjs enableDragToRotateCamera makeRenderer makeTextSprite */

const WIDTH = 350;
const HEIGHT = 350;
const MARGIN = 10;

const plot3d = d3
	.select("#plot3d")
	.attr("width", WIDTH / devicePixelRatio)
	.attr("height", HEIGHT / devicePixelRatio)
	.node();
const plot2d = d3.select("#plot2d").attr("width", WIDTH).attr("height", HEIGHT);

const X_MIN_2d = -1;
const X_MAX_2d = 1;
const Y_MIN_2d = -1;
const Y_MAX_2d = 1;

const xScale2d = d3.scaleLinear([X_MIN_2d, X_MAX_2d], [MARGIN, WIDTH - MARGIN]);
const yScale2d = d3.scaleLinear([Y_MIN_2d, Y_MAX_2d], [HEIGHT - MARGIN, MARGIN]);

const thetaScale3d = d3.scaleLinear(xScale2d.range(), [
	-Math.PI / 2 - 0.7,
	-Math.PI / 2 + 0.7,
]);
const phiScale3d = d3.scaleLinear(yScale2d.range(), [-0.7, 0.7]);

const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera(
	90,
	plot3d.clientWidth / plot3d.clientHeight,
	0.1,
	500,
);

const renderer = makeRenderer(plot3d);
renderer.setSize(plot3d.clientWidth, plot3d.clientHeight);

const SPHERE_POSITION = new THREE.Vector3(0, 0, 0);
const SPHERE_RADIUS = 6;
const CAMERA_DEFAULT_POSITION = new THREE.Vector3(0, -10, 1);
const CAMERA_POINT_OF_FOCUS = SPHERE_POSITION;

const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

enableDragToRotateCamera({
	canvas: plot3d,
	camera,
	scene,
	renderer,
	pointOfFocus: CAMERA_POINT_OF_FOCUS,
	up: CAMERA_UP,
});

const SPHERE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x44aaff,
	transparent: false,
});
const VERTEX_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	transparent: false,
});

const objs3d = { empty: true };
function initialize3d() {
	if (objs3d.empty) {
		{
			scene.add(new THREE.AmbientLight(0x555555));

			const dirLight1 = new THREE.DirectionalLight(0xffcccc, 0.5);
			dirLight1.position.set(7, -8, 10);
			scene.add(dirLight1);

			const dirLight2 = new THREE.DirectionalLight(0xccffcc, 0.5);
			dirLight2.position.set(-7, -8, 10);
			scene.add(dirLight2);

			const dirLight3 = new THREE.DirectionalLight(0xffffff, 0.2);
			dirLight3.position.set(0, -10, 0);
			scene.add(dirLight3);
		}

		{
			const sphereGeometry = new THREE.SphereGeometry(SPHERE_RADIUS, 128, 64);
			const sphere = new THREE.Mesh(sphereGeometry, SPHERE_MATERIAL);
			scene.add(sphere);
		}
	}

	renderer.render(scene, camera);
}

initialize3d();

const angleFormatter = d3.format(".2f");

const vertexPositionsScaled = [];
function initialize() {
	const size = 0.6;
	const nVertices = 3;

	objs3d.vertices = [];
	objs3d.labels = [];
	objs3d.edges = [];

	for (let i = 0; i < nVertices; i++) {
		const _theta2d = (2 * Math.PI * i) / nVertices;
		const x = size * Math.sin(_theta2d);
		const y = size * Math.cos(_theta2d) - 0.1;

		const xs = xScale2d(x);
		const ys = yScale2d(y);
		vertexPositionsScaled.push([xs, ys]);

		const vertex3dGeom = new THREE.SphereGeometry(0.2);
		const vertex3d = new THREE.Mesh(vertex3dGeom, VERTEX_MATERIAL);
		objs3d.vertices.push(vertex3d);

		const label = makeTextSprite(i + 1, {
			fontsize: 16,
			backgroundColor: { r: 255, g: 255, b: 255, a: 1 },
			borderColor: { r: 0, g: 0, b: 0, a: 1 },
			textColor: { r: 0, g: 0, b: 0, a: 1 },
			borderThickness: 2.5,
		});
		objs3d.labels.push(label);

		const edge = new THREE.Mesh(new THREE.BufferGeometry(), VERTEX_MATERIAL);
		objs3d.edges.push(edge);

		scene.add(vertex3d, label, edge);
	}

	function getEdgesData() {
		const edges = d3.range(nVertices).map(i => {
			const j = (i + 1) % nVertices;
			const [x1, y1] = vertexPositionsScaled[i];
			const [x2, y2] = vertexPositionsScaled[j];
			return {
				shape: "line",
				class: "p2d tri-edge",
				index1: i,
				index2: j,
				attrs: {
					x1,
					y1,
					x2,
					y2,
				},
			};
		});
		return edges;
	}

	const edges = getEdgesData();

	const vertexRadius = 13;
	const vertices = vertexPositionsScaled.map(([x, y], i) => ({
		shape: "g",
		class: "p2d vertex-container",
		index: i,
		attrs: {
			transform: `translate(${x} ${y})`,
		},
		children: [
			{
				shape: "circle",
				class: "p2d vertex-dot",
				attrs: { r: vertexRadius },
			},
			{
				shape: "text",
				class: "p2d vertex-label",
				text: i + 1,
				attrs: {
					"text-anchor": "middle",
					"dominant-baseline": "central",
				},
			},
		],
	}));

	const border = (() => {
		const [xMin, xMax] = xScale2d.range().sort();
		const [yMin, yMax] = yScale2d.range().sort();

		return {
			shape: "rect",
			class: "p2d border",
			attrs: {
				x: xMin,
				y: yMin,
				width: xMax - xMin,
				height: yMax - yMin,
				fill: "none",
				stroke: "#ccc",
				"stroke-width": 1,
				"stroke-dasharray": "2 2",
			},
		};
	})();

	applyGraphicalObjs(plot2d, [...edges, ...vertices, border]);

	const dragMargin = vertexRadius + 2;
	const minDragX = xScale2d(X_MIN_2d) + dragMargin;
	const maxDragX = xScale2d(X_MAX_2d) - dragMargin;
	const minDragY = yScale2d(Y_MAX_2d) + dragMargin;
	const maxDragY = yScale2d(Y_MIN_2d) - dragMargin;

	function update(o, dx, dy, index) {
		{
			const [origX1, origY1] = vertexPositionsScaled[index];
			const newX = Math.max(minDragX, Math.min(origX1 + dx, maxDragX));
			const newY = Math.max(minDragY, Math.min(origY1 + dy, maxDragY));

			vertexPositionsScaled[index] = [newX, newY];

			if (o) {
				o.setAttribute("transform", `translate(${newX} ${newY})`);
			}

			const edges = getEdgesData();
			applyGraphicalObjs(plot2d, edges, { selector: ".p2d.tri-edge" });

			const vertex3d = objs3d.vertices[index];

			const theta3d = thetaScale3d(newX);
			const phi3d = phiScale3d(newY);

			const vx = SPHERE_RADIUS * Math.cos(phi3d) * Math.cos(theta3d);
			const vy = SPHERE_RADIUS * Math.cos(phi3d) * Math.sin(theta3d);
			const vz = SPHERE_RADIUS * Math.sin(phi3d);

			vertex3d.position.set(vx, vy, vz);

			const label = objs3d.labels[index];
			label.position.set(...[vx, vy, vz].map(vv => vv * 1.05));
		}

		{
			const vertexPoints = [];
			const nEdgePoints = 50;
			for (let i = 0; i < nVertices; i++) {
				const edge = objs3d.edges[i];
				edge.geometry.dispose();

				const [x1, y1] = vertexPositionsScaled[i];
				const [x2, y2] = vertexPositionsScaled[(i + 1) % nVertices];
				const [theta1, theta2] = [x1, x2].map(thetaScale3d);
				const [phi1, phi2] = [y1, y2].map(phiScale3d);

				const [vx1, vx2] = [
					[theta1, phi1],
					[theta2, phi2],
				].map(
					([theta, phi]) => SPHERE_RADIUS * Math.cos(phi) * Math.cos(theta),
				);

				const [vy1, vy2] = [
					[theta1, phi1],
					[theta2, phi2],
				].map(
					([theta, phi]) => SPHERE_RADIUS * Math.cos(phi) * Math.sin(theta),
				);

				const [vz1, vz2] = [
					[theta1, phi1],
					[theta2, phi2],
				].map(([_, phi]) => SPHERE_RADIUS * Math.sin(phi));

				const xInterp = d3.interpolateNumber(vx1, vx2);
				const yInterp = d3.interpolateNumber(vy1, vy2);
				const zInterp = d3.interpolateNumber(vz1, vz2);
				const interpolators = [xInterp, yInterp, zInterp];

				const edgePoints = [];
				for (let j = 0; j < nEdgePoints; j++) {
					const t = j / (nEdgePoints - 1);
					let [vx, vy, vz] = interpolators.map(f => f(t));
					const norm = Math.sqrt(vx ** 2 + vy ** 2 + vz ** 2);
					const r = SPHERE_RADIUS / norm;
					vx *= r;
					vy *= r;
					vz *= r;

					edgePoints.push(new THREE.Vector3(vx, vy, vz));
				}

				const curve = new THREE.CatmullRomCurve3(edgePoints);
				const tube = new THREE.TubeGeometry(curve, 64, 0.05);
				edge.geometry = tube;

				// origin and the actual vector
				vertexPoints.push(new THREE.Vector3(vx1, vy1, vz1));
			}

			const angles = [];
			// tl;dr to get angle ABC, we:
			// 1. project BA and BC onto the plane normal to the sphere and incident
			//    with B
			// 2. take the inner product of those two vectors, then use the fact that
			//    |<u,v>| = |u| |v| cos(theta)
			//
			// To compute (1.), we project BA and BC onto B's position vector and then
			// subtract, as a vector is the sum of its components parallel to and
			// perpendicular to another vector
			for (let i = 0; i < nVertices; i++) {
				const p0 = vertexPoints[i];
				const p1 = vertexPoints[(i - 1 + nVertices) % nVertices];
				const p2 = vertexPoints[(i + 1) % nVertices];

				const [v1, v2] = [p1, p2].map(p => p.clone().sub(p0));

				// Project onto normal plane incident with p0
				const [proj1, proj2] = [v1, v2].map(v =>
					v.clone().sub(v.clone().projectOnVector(p0)),
				);

				const innerProduct = proj1.dot(proj2);
				const angle = Math.acos(
					innerProduct / (proj1.length() * proj2.length()),
				);

				angles.push(angle);
			}

			const angleSumDeg = (angles.reduce((a, b) => a + b) * 180) / Math.PI;
			document.getElementById("angle-sum").innerText =
				angleFormatter(angleSumDeg);

			// for (let i = 0; i < nVertices; i++) {}
		}

		renderer.render(scene, camera);
	}

	d3.range(nVertices).forEach(i => update(null, 0, 0, i));

	const dragHandler = d3
		.drag()
		.on("start", () => {
			document.body.style.cursor = "grabbing";
		})
		.on("drag", function (event, d) {
			const { dx, dy } = event;
			const { index } = d;

			update(this, dx, dy, index);
		})
		.on("end", () => {
			document.body.style.cursor = null;
		});
	plot2d.selectAll(".vertex-container").call(dragHandler);

	renderer.render(scene, camera);
}

initialize();
