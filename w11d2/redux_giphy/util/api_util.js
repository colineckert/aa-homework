export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=OkHtffFl4Fu6jDyD1txyWjb7m5p0ovaf&limit=2`
  });
}
