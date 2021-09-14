function log(str) {
  console.log(str)
}

function disableSaveShortcut() {
  document.addEventListener("keydown", preventSave, false);
}

function enableSaveShortcut() {
  document.removeEventListener("keydown", preventSave);
}

function preventSave(e) {
  var isModifierPressed = navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey;
  if (!isModifierPressed || e.altKey || e.shiftKey) return;

  var char = String.fromCharCode(e.which).toLowerCase();

  if (char === 's') {
    e.preventDefault();
  }
}