const N_IMAGES = 64;
const FRAME_DURATION = 50;

let currImgNum = 0;

const slider = document.getElementById("input-rotation-angle");

function getImageID(i) {
	return `img-${i}`;
}

for (let i = 0; i <= N_IMAGES; ++i) {
	const img = document.getElementById(getImageID(i));

	img.classList = "spin-img";
	img.style.display = i === currImgNum ? "block" : "none";
}

let timer;

// eslint-disable-next-line no-unused-vars
function updateRotation(imgNum, { animated = false } = {}) {
	clearInterval(timer);

	const imgs = document.getElementsByClassName("spin-img");

	if (animated) {
		for (let i = 0; i < imgs.length; ++i) {
			const img = imgs.namedItem(getImageID(i));
			img.style.display = +i === +currImgNum ? "block" : "none";
		}
		let i = +currImgNum;
		if (imgNum === currImgNum) {
			return;
		} else if (imgNum > currImgNum) {
			timer = setInterval(() => {
				imgs[i].style.display = "none";
				imgs[i + 1].style.display = "block";

				i += 1;
				if (i >= imgNum) {
					clearInterval(timer);
				}

				currImgNum = i;
				slider.value = currImgNum;
			}, FRAME_DURATION);
		} else {
			timer = setInterval(() => {
				imgs[i].style.display = "none";
				imgs[i - 1].style.display = "block";

				i -= 1;
				if (i <= imgNum) {
					clearInterval(timer);
				}

				currImgNum = i;
				slider.value = currImgNum;
			}, FRAME_DURATION);
		}
	} else {
		for (let i = 0; i < imgs.length; ++i) {
			const img = imgs.namedItem(getImageID(i));
			img.style.display = +i === +imgNum ? "block" : "none";
		}
		currImgNum = imgNum;
	}
}
