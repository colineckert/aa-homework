document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById('mycanvas');
  canvasEl.height = 500;
  canvasEl.width = 500;

  const ctx = canvasEl.getContext('2d');
  ctx.fillStyle = "red";
  ctx.fillRect(100, 100, 400, 300)

  ctx.beginPath();
  ctx.arc(100, 100, 50, 0, (2*Math.PI), true);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 4;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();
});
