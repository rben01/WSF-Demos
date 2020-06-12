/* globals ROCKET PROJECTILE drawGraph graphObjs _updateSpeedHelper _addGraphicalObjs subcanvases getGraphData getGridlinesData */

// eslint-disable-next-line no-unused-vars
function updateRocketSpeed(speedStr, { fromUserInput = true } = {}) {
	return _updateSpeedHelper(speedStr, {
		fromUserInput,
		obj: ROCKET,
		baseObject: PROJECTILE,
	});
}

// eslint-disable-next-line no-unused-vars
function updateProjectileSpeed(speedStr, { fromUserInput = true } = {}) {
	return _updateSpeedHelper(speedStr, {
		fromUserInput,
		obj: PROJECTILE,
		baseObject: PROJECTILE,
	});
}

drawGraph({ baseObject: PROJECTILE });

graphObjs.features = _addGraphicalObjs(subcanvases, () =>
	getGraphData({ baseObject: PROJECTILE }),
);
