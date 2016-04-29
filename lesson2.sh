1. 

var SomeClassAsFunction = function(){};
SomeClassAsFunction.prototype.print = function () {
  console.log('some string to print');
};

SomeClassAsFunction.print = function () {
  console.log('some string to print 2');
};

var someConcreateClassAsFunction = new SomeClassAsFunction();
someConcreateClassAsFunction.print(); //Вызов метода, унаследованого от прототипа
SomeClassAsFunction.print(); //Вызов метода класса


2. Почему вот этот код не будет работать

var SomeOtherClassAsObject = {
  print: function() {
    console.log('some other string to print');
  }
};

//Обьект прототипа существует в обьектах созданных через конструктор, поэтому мы не можем обьявить
//метод print через прототип
SomeOtherClassAsObject.prototype.print = function () {
  console.log('some other string to print 2');
};

SomeOtherClassAsObject.print();

3. Почему и вот это не поможет 
var SomeOtherOtherClassAsObject = new Object(); // мы создаем экземпляр класса Object, который не емеет метода print.



#Inheritance example
function Animal(name, legs) {
	this.name = name;
	this.legs = legs;
	this.printInfo = function() {
		for(var i in this) {
			console.log(this[i]);
		}
 	}
}

function Dog(breed, name) {
	this.breed = breed;
	Animal.call(this, name, 4);
}
Dog.prototype = new Animal();

var pitBull = new Dog("pitBull", "Tyzik");
pitBull.printInfo();
