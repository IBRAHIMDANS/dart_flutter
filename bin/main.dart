void main(List<String> arguments) {
  Vehicle vehicle = Vehicle(25, "bike");
  print(vehicle.runtimeType);

  Vehicle car = Vehicle(25, "car");
  print(car.runtimeType);

  /*print(v1.speed);
  v1.speedUp(50);
  print(v1.speed);*/
}

abstract class Vehicle {
  int _speed;
  final int capacity;

  factory Vehicle(int speed, String type) {
    switch (type) {
      case "bike":
        return Bike(speed);
      case "car":
        return Car(speed);
      default:
        throw Exception('Unknown type');
    }
  }

  Vehicle._(this._speed, this.capacity);

  int get speed => _speed;

  void speedUp(int speed) {
    _speed += speed;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vehicle &&
          runtimeType == other.runtimeType &&
          speed == other.speed &&
          capacity == other.capacity;

  @override
  int get hashCode => speed.hashCode ^ capacity.hashCode;

  @override
  String toString() {
    return 'Vehicle{speed: $speed, capacity: $capacity}';
  }
}

class Bike extends Vehicle {
  Bike(int speed) : super._(speed, 1);
}

class Car extends Vehicle {
  Car(int speed) : super._(speed, 4);
}
