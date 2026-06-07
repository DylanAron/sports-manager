export default (recommendContent) => {
	let list = [];
	try {
		if (recommendContent) {
			return recommendContent.split(',');
		}
	} catch {}
	return [];
}