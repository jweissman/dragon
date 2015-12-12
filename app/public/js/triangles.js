(function($, global) {
  var init_triangles = function() {
    console.log("INIT TRIANGLES");
    var height = window.innerHeight + 10;
    var width = window.innerWidth + 10;
    console.log('width', width);
    console.log('height', height);

    var pattern = Trianglify({
      height: height,
      width: width,
      cell_size: 36,
      x_colors: 'Greens',
      y_colors: 'Greens'
    });

    var bg = document.getElementById("bg");
    while (bg.firstChild) { bg.removeChild(bg.firstChild); }

    bg.appendChild(pattern.canvas());
  };

  $(document).on('page:load', init_triangles);
  $(document).ready(init_triangles);
  window.addEventListener('resize', init_triangles);

}(jQuery, window));
