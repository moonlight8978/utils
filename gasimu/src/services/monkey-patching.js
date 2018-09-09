const monkeyPatching = () => {
  Array.contains = function(elementQuantity) {
    return new Array(elementQuantity).fill(0)
  }

  Array.prototype.elements = function() {
    return this
  }
}

export default monkeyPatching