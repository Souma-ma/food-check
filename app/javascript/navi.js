function foodNavi() {
  const button = document.getElementById('navi');
  const sentence = document.getElementById('sentence');

  button.addEventListener('click', () => {
    if (sentence.getAttribute("style") == "display:block;") {
      sentence.removeAttribute("style" , "display:block;")
    } else{
      sentence.setAttribute("style" , "display:block;")
    }
  })
}

window.addEventListener('load', foodNavi)