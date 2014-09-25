Number.prototype.doubleThisNumber = function() {
  return this + this; 
}; 

Number.prototype.quadrupleThisNumber = function() {
  return this.doubleThisNumber() + this.doubleThisNumber(); 
};