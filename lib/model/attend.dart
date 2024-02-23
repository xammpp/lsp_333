class Attendant {
  final String username;
  final String location;
  final DateTime timestamp;

  Attendant({
    required this.username,
    required this.location,
    required this.timestamp,
  });

  factory Attendant.fromMap(Map<String, dynamic> map) {
    return Attendant(
      username: map['username'],
      location: map['location'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'location': location,
      'timestamp': timestamp.toIso8601String(), // Convert DateTime to string
    };
  }
}
