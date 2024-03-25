const data = JSON.parse(`
{
  "Java" : {
    "PDE": {"Source":"https://jemrules.github.io/Pong/Pong.pde"}
  },
  "Python" : {
    "PyGame" : {"Source":"https://jemrules.github.io/Pong/Pong.py"}
  },
  "Ruby": {
    "CmdLn" : {"Source":"https://jemrules.github.io/Pong/Ruby.rb"}
  }
}`);
document.body.onload = loadSources;

function loadSources() {
  console.log(data["Java"]);
  let srcs = document.getElementsByTagName("body")[0];
  for (var x in data) {
    let ele = document.createElement("select");
    // ele.parentElement(document.getElementsByName("sources"))
    console.log(x);
    ele.setAttribute("name", x);
    srcs.appendChild(ele);
    let op = document.createElement("option");
    op.textContent = x;
    ele.appendChild(op);
    for (var y in data[x]) {
      let op = document.createElement("option");
      op.setAttribute("onclick", "window.location.href=this.value;");
      console.log(data[x][y]["Source"]);
      op.setAttribute("value", data[x][y]["Source"]);
      op.textContent = y;
      ele.appendChild(op);
    }
  }
}
