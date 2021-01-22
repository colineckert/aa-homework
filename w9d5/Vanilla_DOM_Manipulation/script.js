document.addEventListener("DOMContentLoaded", () => {
  
  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // adding SF places as list items
  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const placeNameInputEl = document.querySelector(".favorite-input");
    const placeName = placeNameInputEl.value;
    placeNameInputEl.value = "";

    const placesList = document.getElementById("sf-places");
    const newPlaceLi = document.createElement("li");
    newPlaceLi.textContent = placeName;
    
    placesList.appendChild(newPlaceLi);
  };

  const placeSubmitButton = document.querySelector(".favorite-submit");
  placeSubmitButton.addEventListener("click", handleFavoriteSubmit);
  

  // adding new photos
  const showPhotoForm = (e) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container") {
      photoForm.className = "photo-form-container hidden";
    } else {
      photoForm.className = "photo-form-container";
    }
  };

  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", showPhotoForm);

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoInputEl = document.querySelector(".photo-url-input");
    const photoUrl = photoInputEl.value;
    photoInputEl.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;
    
    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);
    
    const photosList = document.querySelector(".dog-photos");
    photosList.appendChild(newPhotoLi);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);
});
